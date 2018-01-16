import Ember from 'ember';

export default Ember.Route.extend({
  titleToken: 'Administration',

  ajax: Ember.inject.service('ajax'),
  counters: null,
  model: function(){
    var self = this;

    this.get('ajax').ajaxRequest("/api/v1/admin/getAdministrationCounters", "GET", null, false).fail(function(data) {
      console.log(data);
    }).then(function(data) {
      self.set('counters', data);

      console.log(self.get('counters'));
    });

    //Return model to template
    return Ember.RSVP.hash({
      counters: self.get('counters')
    });
  }
});
