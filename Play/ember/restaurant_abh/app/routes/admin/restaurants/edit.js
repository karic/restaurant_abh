import Ember from 'ember';
import Location from '../../../models/location';
import Notification from '../../../models/notification';

export default Ember.Route.extend({
  ajax: Ember.inject.service('ajax'),
  location: Location.create(),
  notification: Notification.create(),

  exit: function(){
    this.set('notification.visible', false);
  },
  actions: {
    cancel: function(){
      this.transitionTo('admin.restaurants');
    }
  },
  model: function(param){
    var self = this;

    if(param.id != null){
      //Set restaurant id
      self.set('location.id', param.id);

      this.get('ajax').ajaxRequest("/api/v1/admin/getLocationDetails", "POST", '{"id":'+param.id+'}',
        false).fail(function(data) {
          console.log(data);
      }).then(function(data) {
       //Set fetched items
        self.set('location', data);
      });
    }

    //Scroll to top
    $("html, body").animate({ scrollTop: 0 }, 500);

    //Return model to template
    return Ember.RSVP.hash({
      location: self.get('location'),
      notification: self.get('notification')
    });

  }
});
