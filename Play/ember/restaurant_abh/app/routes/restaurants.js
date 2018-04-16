import Ember from 'ember';
import Filter from '../models/filter';

export default Ember.Route.extend({
  titleToken: 'Restaurants',

  ajax: Ember.inject.service('ajax'),
  listRestaurants: null,
  listRestaurantsLocations: null,
  restaurantsPages: [],
  currentPageNumber: 1,
  itemsPerPage:6,
  filter: Filter.create(),
  categories: [],
  searchTextFilterDisplay: null,

  currentLocationCoordinates: [],
  geolocation: Ember.inject.service(),

  getRestaurants: function(){
    var self = this;

    //Set additional data
    this.set('filter.itemsPerPage', this.get('itemsPerPage'));
    this.set('filter.pageNumber', this.get('currentPageNumber'));

    //Add coordinates to filter
    this.set('filter.latitude', self.get('currentLocationCoordinates')[0]);
    this.set('filter.longitude', self.get('currentLocationCoordinates')[1]);

    var tempData = self.get('filter');
    tempData = JSON.parse(JSON.stringify(tempData));
    tempData.priceRange = null;

    //Get number of pages for display restaurants
    this.get('ajax').ajaxRequest("/api/v1/getRestaurantsByFilter", "POST", JSON.stringify(tempData), false).fail(function(data) {
      console.log(data);
    }).then(function(data) {
      //Set info about number of pages
      var numberOfPages = JSON.parse(data.numberOfRestaurantPages);
      self.set('restaurantsPages', []);
      for(var i = 1; i <= numberOfPages; i++){
        self.get('restaurantsPages').push(i);
      }

      //Set restaurants
      self.set('listRestaurants', data.restaurants);

    });
  },

  init(){
    var self = this;

    this.get('geolocation').getLocation().then(function(geoObject) {
      var currentLocation = self.get('geolocation').get('currentLocation');

      //Set current coodrinates
      if(currentLocation != "undefined"){
        self.set('currentLocationCoordinates', currentLocation);
        console.log(currentLocation);
        self.refresh();
      } else { //TEMP IF UNABLE TO DEDERMINE
        self.set('currentLocationCoordinates', [43.847022, 18.374300]);
        console.log(currentLocation);
        self.refresh();
      }


    });

    //Get all categories of restaurant
    this.get('ajax').ajaxRequest("/api/v1/getAllCategories", "GET", null, false).fail(function(data) {
      console.log(data);
    }).then(function(data) {

      //Set categories
      self.set('categories', data);

      //Get all locations for restaurants
      self.get('ajax').ajaxRequest("/api/v1/getRestaurantsLocations", "GET", null, false).fail(function(data) {
        console.log(data);
      }).then(function(data) {
        self.set('listRestaurantsLocations', data);
      });

    });
  },

  model: function(param){
    var self = this;

    if(param.pageNumber != null){
      //Set page number from url
      this.set('currentPageNumber', param.pageNumber);
    }

    if(param.location != null){
        //Set page number from url
        this.set('filter.location', param.location);
     }

    //Get all restaurants
    this.getRestaurants();

    //Scroll to top
    $("html, body").animate({ scrollTop: 0 }, 500);

    //Return model to template
    return Ember.RSVP.hash({
      listRestaurants: self.get('listRestaurants'),
      listRestaurantsLocations: self.get('listRestaurantsLocations'),
      restaurantsPages: self.get('restaurantsPages'),
      currentPageNumber: self.get('currentPageNumber'),
      filter: self.get('filter'),
      categories: self.get('categories'),
      activeStarFilter:  self.get('activeStarFilter'),
      searchTextFilterDisplay: self.get('searchTextFilterDisplay'),
      searchTextRestaurants: self.get('searchTextRestaurants')
    });
  },

  actions: {
    changePage: function(pageNumber){
      //Change page variable
      this.set('currentPageNumber', pageNumber);

      //Refresh list of restaurants on page
      this.getRestaurants();
      this.refresh();

      //Scroll to top
      $("html, body").animate({ scrollTop: 0 }, 500);

      //Set CSS active state
      $(".pagination li").removeClass("active");
      $("#pagination_" + pageNumber).addClass("active");

      //Go to route page
      this.transitionTo('restaurants', pageNumber);
    },

    clickLocation: function(value){
      //Check is activation or deactivation (if is clicked on same value then deactivate)
      if(this.get('filter.location') == value){
        this.set('filter.location', null);
        this.transitionTo('/restaurants/1');
      } else {
        this.set('filter.location', value);
        this.transitionTo('/restaurants/1?location=' + value);
      }

      //Scroll to top
      $("html, body").animate({ scrollTop: 0 }, 500);
      this.refresh();

      console.log(this.get('filter'));
    },

    clickDolar: function(value){
      //Check is activation or deactivation (if is clicked on same value then deactivate)
      if(this.get('filter.priceRange') == value){
        this.set('filter.priceRange', null);
      } else {
        this.set('filter.priceRange', value);
      }

      //Show filtered restaurants
      this.getRestaurants();
      this.refresh();

      console.log(this.get('filter'));
    },

    clickStar: function(value){
      //Check is activation or deactivation (if is clicked on same value then deactivate)
      if(this.get('filter.mark') == value){
        this.set('filter.mark', null);
      } else {
        this.set('filter.mark', value);
      }

      //Show filtered restaurants
      this.getRestaurants();
      this.refresh();

      console.log(this.get('filter'));
    },


    clickCategory: function(categoryId){
      function isValueInArray(array, value){
        for (var i = 0; i < array.length; i++) {
            if (array[i] === value) {
              return true;
            }
        }
        return false;
      }

      //Check is this in category already (if true remove)
      if(isValueInArray(this.get('filter.categories'), categoryId)){
        //Remove element from array
        var indexDeleteElement = this.get('filter.categories').indexOf(categoryId);
        if (indexDeleteElement > -1) {
            this.get('filter.categories').splice(indexDeleteElement, 1);
        }
      } else {
        this.get('filter.categories').pushObject(categoryId);
      }

      //Force template to change active category color
      this.set("filter.categories", this.get('filter.categories').sort().slice());

      //Show filtered restaurants
      this.getRestaurants();
      this.refresh();

      //Test log
      console.log(this.get('filter'));
    },

    search: function(){
      this.getRestaurants();

      //Set Search Text displayed in breadcrumb
      this.set('searchTextFilterDisplay', this.get('filter.searchText'));

      this.refresh();
      console.log("OVO JE PRETRAGA");
      console.log(this.get('filter'));
    },

    setSuggestedValue(string){
      this.set('filter.searchText', string);
    }
  }
});
