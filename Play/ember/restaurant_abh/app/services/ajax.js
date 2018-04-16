import Ember from 'ember';

export default Ember.Service.extend({
  currentUser: Ember.inject.service('current-user'),

  ajaxRequest(url, method, data, async) {
    if (async === undefined) {
      async = true;
    }

    var token = this.get('currentUser').getToken();

    return $.ajax({
      url: url,
      type: method,
      data: data,
      async:async,
      processData: false,
      contentType: "application/json; charset=UTF-8",
      headers: {
        'X-AUTH-TOKEN': token
      },
    });
  }
});
