import Ember from 'ember';

export default Ember.Component.extend({
  currentUser: Ember.inject.service('current-user'),
  ajax: Ember.inject.service('ajax'),
  actions: {
      logOut: function(){
        var self = this;

        var token = this.get('currentUser').getToken();

        //Send POST to Play vote route
        this.get('ajax').ajaxRequest("/api/v1/logout/" + token, "GET").fail(function(data) {
          console.log(data);
        }).done(function(data) {
          window.location.reload();
        });
      }
    }
});
