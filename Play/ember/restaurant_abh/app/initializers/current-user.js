import User from '../models/user';
import CurrentUser from '../services/current-user-service';

export function initialize(application) {
  var self = this;
  // application.inject('route', 'foo', 'service:foo');

  //Start waiting for response from Play
  application.deferReadiness();

  //Inject cookies to controller and routes
  application.inject('controller', 'cookie', 'cookie:main');
  application.inject('route', 'cookie', 'cookie:main');

  //Inject router in all components
  application.inject('component', 'router', 'router:main');

  // Get token from browser
  if ($.cookie("token")) {
    var token = $.cookie("token");
  }

  return $.ajax({
    url: "/api/v1/currentUser/" + token,
    type: "GET",
    contentType: "application/json; charset=UTF-8",
  }).fail(function(data) {
    console.log(data);

    //Continue with app
    application.advanceReadiness();

    var servistest = CurrentUser.create();
    application.register('service:current-user', servistest, { instantiate: false, singleton: true });

    //self.transitionTo('login');
  }).done(function(data) {
    //console.log(data);

    var servistest = CurrentUser.create();
    var user = User.create(data);
    user.token = token;

    //Insert user data in service
    servistest.setUser(user);

    application.register('service:current-user', servistest, { instantiate: false, singleton: true });

    //Continue with app
    application.advanceReadiness();

  });


}

export default {
  after: ['cookie'],
  initialize
};
