import Ember from 'ember';

export default Ember.Route.extend({
  titleToken: 'Reservations',

  listReservations: null,
  ajax: Ember.inject.service('ajax'),
  currentUser: Ember.inject.service(),
  model: function(){
    var self = this;

    if(this.get('currentUser.userLoggedIn') == false){
      self.transitionTo('index');
    }

    //Get list of all restaurants from database
    this.get('ajax').ajaxRequest("/api/v1/getListOfReservationsForUser", "GET", null, false).fail(function(data) {
      console.log(data);
    }).then(function(data) {
      console.log(data);
      self.set('listReservations', data);
    });

    //Return model to template
    return Ember.RSVP.hash({
      listReservations: self.get('listReservations')
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

          //Show notification
          $(".loginNotifications").show();
          //Change alert class
          $(".alert").addClass('alert-success').removeClass('alert-danger');
          //Set alert text
          var json = JSON.parse(data);
          //Set alert text
          $(".alertText").html(json["ok"]);
        });
    }
  }
});
