import Ember from 'ember';

export default Ember.Route.extend({
  titleToken: 'Find table',

  ajax: Ember.inject.service('ajax'),
  currentReservation: Ember.inject.service(),
  restaurants: [],

  actions: {
    proceedToReservationComplete: function(){
      //Transition to route
      this.transitionTo('completereservation');
    }
  },

  model: function(){
    var self = this;

    if(this.get('currentReservation.people') == null){
      this.transitionTo('index');
    } else {
      this.get('ajax').ajaxRequest("/api/v1/getFreeTables", "POST", JSON.stringify(this.get('currentReservation')),
        false).fail(function(data) {
          console.log(data);
      }).then(function(data) {
        //Set fetched data
        self.set('restaurants', data);
        console.log(self.get('restaurants'));
      });
    }

    //Return model to template
    return Ember.RSVP.hash({
      restaurants: self.get('restaurants'),
      currentReservation: self.get('currentReservation')
    });
  }
});
