import Ember from 'ember';
import Restaurant from '../models/restaurant';
import RestaurantMenu from '../models/restaurantmenu';
import Comment from '../models/comment';

export default Ember.Route.extend({
  titleToken: function(model) {
    return this.get('restaurantDetails.restaurantName');
  },

  ajax: Ember.inject.service('ajax'),
  restaurantId: null,
  restaurant: Restaurant.create(),
  currentUser: Ember.inject.service(),
  restaurantDetails: null, //This is in return
  restaurantsStatsStyle: null,
  restaurantMenu: RestaurantMenu.create(),
  currentReservation: Ember.inject.service(),
  comment: Comment.create(),

  galleryNumberOfImages: null,
  galleryImages: [],
  showImages: 7,
  addSeeAllPhotosFeature: false,
  galleryFirstImage: null,

  setupController: function(controller, model){
    this._super(controller, model);

    controller.set('tablesAvailable', null);

    //Animate to top of the page
    //$("html, body").animate({ scrollTop: 0 }, 500);
  },

  exit: function(){
    this.set('showImages', 7);
  },

  actions: {
    vote: function(mark, comment){
      //Insert data in comment object
      this.set('comment.mark', mark);
      this.set('comment.idUser', this.get('currentUser.userId'));
      this.set('comment.idRestaurant', this.get('restaurantId'));
      this.set('comment.comment', comment);

      //Get menu for restaurant
      this.get('ajax').ajaxRequest("/api/v1/insertComment", "POST", JSON.stringify(this.get('comment')),
        false).fail(function(data) {
          console.log(data);
      }).then(function(data) {
        console.log('USPJESNO');
      });

      //Change values in restaurantDetails
      this.refresh();
    },
    seeAllPhotos: function(){
      this.set('showImages', 200);
      this.refresh();
    }
  },
  model: function(param){
    var self = this;

    //Animate to top of the page
    $("html, body").stop().animate({ scrollTop: 0 }, 100);

    //If logged set style that enable hover on stars for vote
    if(this.get('currentUser.userLoggedIn') == true){
      this.set('restaurantsStatsStyle', 'statslogged')
    } else {
      this.set('restaurantsStatsStyle', 'stats')
    }

    //Put url id into restaurant object
    this.set('restaurantId', param.restaurantId)
    this.set('restaurant.id', param.restaurantId);

    //Convert object in JSON
    var data = JSON.stringify(this.get('restaurant'));

    //Ajax call to get restaurant details
    this.get('ajax').ajaxRequest("/api/v1/getRestaurantDetails", "POST", data, false).fail(function(data) {
      console.log(data);
    }).then(function(data) {
      self.set('restaurantDetails', data);

      //Get menu for restaurant
      self.get('ajax').ajaxRequest("/api/v1/getRestaurantMenu", "POST",
        '{"idRestaurant":"'+param.restaurantId+'", "type":"Breakfast"}', false).fail(function(data) {
        console.log(data);
      }).then(function(data) {
        self.set('restaurantMenu', data);
      });

    });
    //Return model to template
    return Ember.RSVP.hash({
      restaurantDetails: self.get('restaurantDetails'),
      restaurantsStatsStyle: self.get('restaurantsStatsStyle'),
      restaurantMenu: self.get('restaurantMenu'),
      galleryNumberOfImages: self.get('galleryNumberOfImages'),
      galleryImages: self.get('galleryImages'),
      addSeeAllPhotosFeature: self.get('addSeeAllPhotosFeature'),
      galleryFirstImage: self.get('galleryFirstImage'),
      currentUser: self.get('currentUser')
    });

  }
});
