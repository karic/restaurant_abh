import Ember from 'ember';
import User from '../models/user';

export default Ember.Service.extend({
  userLoggedIn:false,
  userId:null,
  userFirstName:null,
  token:null,
  isAdmin:false,
  setUser(user){
    this.set("userLoggedIn", true);
    this.set("userFirstName", user.get('firstName'));
    this.set("userId", user.get('id'));
    this.set("token", user.get('token'));

    //HARDCODED is user admin
    if(user.get('id') == "3000"){
       this.set("isAdmin", true);
    }
  },
  getToken() {
    return this.get('token');
  }
});
