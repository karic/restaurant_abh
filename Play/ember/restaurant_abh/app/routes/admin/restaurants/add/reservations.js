import Ember from 'ember';

export default Ember.Route.extend({
  titleToken: 'Reviews / Restaurants / Administration',

  ajax: Ember.inject.service('ajax'),
  listItems: [],
  idRestaurant: null,

  model: function(param){
    var self = this;

    if(param.id == null){
      //Prevent display this page
    } else {
      self.set('idRestaurant', param.id);
    }

    this.get('ajax').ajaxRequest("/api/v1/admin/getAllRestaurantReservations", "POST",
      '{"idRestaurant": '+param.id+'}', false).fail(function(data) {
        console.log(data);
    }).then(function(data) {
      self.set('listItems', data);
      console.log(self.get('listItems'));
    });

    //Return model to template
    return Ember.RSVP.hash({
      listItems: self.get('listItems'),
      idRestaurant: self.get('idRestaurant')
    });
  },

  actions: {
    cancelReservation(idReservation){
      var self = this;

      //Get list of all restaurants from database
      this.get('ajax').ajaxRequest("/api/v1/cancelReservation", "POST", '{"idReservation": '+idReservation+'}',
        false).fail(function(data) {
          console.log(data);
      }).then(function(data) {
        self.refresh();
      });
    }
  }
});
