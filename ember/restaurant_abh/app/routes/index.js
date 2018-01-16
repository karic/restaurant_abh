import Ember from 'ember';

export default Ember.Route.extend({
  ajax: Ember.inject.service('ajax'),
  listRestaurants: null,
  listRestaurantsLocations: null,

  currentLocationCoordinates: [],

  geolocation: Ember.inject.service(),

  init: function() {
    var self = this;

    this.get('geolocation').getLocation().then(function(geoObject) {
      var currentLocation = self.get('geolocation').get('currentLocation');

      //Set current coodrinates
      if(currentLocation.length == 2){
        self.set('currentLocationCoordinates', currentLocation);
        console.log(currentLocation);
        self.refresh();
      }


    });
  },

  model: function(){
    var self = this;

    //Animate to top of the page
    $("html, body").stop().animate({ scrollTop: 0 }, 100);

    //Get list of popular restaurants for lunch today
    this.get('ajax').ajaxRequest("/api/v1/allRestaurantsSortReservationsToday", "GET", null, false).fail(function(data) {
      console.log(data);
    }).then(function(data) {
      self.set('listRestaurants', data);

      //Get all locations for restaurants
      self.get('ajax').ajaxRequest("/api/v1/getRestaurantsLocations", "GET", null, false).fail(function(data) {
        console.log(data);
      }).then(function(data) {
        self.set('listRestaurantsLocations', data);
      });
    });

    //Return model to template
    return Ember.RSVP.hash({
      listRestaurants: self.get('listRestaurants'),
      listRestaurantsLocations: self.get('listRestaurantsLocations'),
      currentLocationCoordinates: self.get('currentLocationCoordinates')
    });
  },
});






