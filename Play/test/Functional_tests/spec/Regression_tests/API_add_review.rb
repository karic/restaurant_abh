require 'rest-client'
require 'json'
require './setup_browser'

setup = SetupBrowser.new

url = setup.domain.to_s + ":" + setup.port.to_s + setup.apiversion.to_s

describe "API test: add review (new user and restaurant)" do

before(:all) do 
  @id_token = { :id=>"" }
  @id_restaurant = { :id=>"" }
  @id_user = { :id=>"" }
  @id_token_user = { :id=>"" }
end

context "Log in as admin user" do
    it "admin user logs in sucessfully" do
      login= RestClient.post(url+'/login', {email:'irfankr91@gmail.com',password:'12345', rememberMe:'false'})
      parsed = JSON.parse(login.body)
      id_admin_user= parsed['id']
      @id_token[:id]= parsed['token']
      #puts @id_token[:id]
      expect(login.code).to match(200)
      expect(parsed['email']).to match (/irfankr91@gmail.com/i)
      expect(parsed['firstName']).to match (/Irfan/i) 
      expect(parsed['lastName']).to match (/Krijestorac/i)
      end
    end

context "Add new restaurant" do
    it "admin adds new restaurant sucessfully" do
    restaurant= RestClient.post(url+'/admin/addRestaurant', {"longitude":0,"latitude":25,"restaurantName":"Restaurant test","priceRange":2,"location":3005,"description":"Great food","imageFileName":"assets/images/restaurant_logo­e059c3ec2f71d19b1d67f0d80acb45bb.jpg","coverFileName":"assets/images/restaurant_cover­53bb94de27cf68e4efdddd83ac7c8a84.jpg","categories":[3002]}, :'X-AUTH-TOKEN'=>@id_token[:id])
      parsed = JSON.parse(restaurant.body)
      @id_restaurant[:id]= parsed['id']
      expect(restaurant.code).to match(200)
      expect(parsed['restaurantName']).to match (/Restaurant test/i)
    expect(parsed['description']).to match (/Great food/i)     
    end
  end

context "Register a new user" do
    it "new user registered sucessfully" do
    register= RestClient.post(url+'/register', {email:'noviuserxx@gmail.com',firstName:'Novi',lastName:'Korisnik',Phone:'13215156',country:'BiH',city:'Maglaj',password:'10062016'})
    parsed = JSON.parse(register.body)
    @id_user[:id]= parsed['id']
    expect(register.code).to match(200)
    expect(parsed['firstName']).to match(/Novi/i)
    expect(parsed['lastName']).to match(/Korisnik/i)
    expect(parsed['email']).to match(/noviuserxx@gmail.com/i)
    end
  end

context "Log in user" do
    it "user logs in sucessfully" do
      login= RestClient.post(url+'/login', {email:'noviuserxx@gmail.com',password:'10062016', rememberMe:'false'})
      parsed = JSON.parse(login.body)
      id_current= parsed['id']
      @id_token_user[:id]= parsed['token']
      expect(login.code).to match(200)
      expect(id_current.to_s === @id_user[:id].to_s).to be true 
      end
    end

context "Add review to restaurant" do
    it "new review added sucessfully" do
    com= RestClient.post(url+'/insertComment', {"mark":"3","idUser":@id_user[:id],"idRestaurant":@id_restaurant[:id],"comment":"I like to eat in this restaurant"},:'X-AUTH-TOKEN'=>@id_token_user[:id])
    parsed = JSON.parse(com.body)
    expect(com.code).to match(200)
    expect(parsed['mark']).to match(3)
    end
  end

context "Check added review for new restaurant" do
    it "new review added and listd sucessfully" do
    comment= RestClient.post(url+'/admin/getAllRestaurantComments', {"idRestaurant":@id_restaurant[:id]}, :'X-AUTH-TOKEN'=>@id_token[:id])
    parsed = JSON.parse(comment.body)
    expect(comment.code).to match(200)
    mark = parsed[0]['mark']
    comen = parsed[0]['comment']
    expect(mark).to match(3)
    expect(comen).to match(/I like to eat in this restaurant/i)
    end
  end

context "Delete newly added restaurant" do
    it "admin deletes newly added restaurant sucessfully" do
      restaurant= RestClient.post(url+'/admin/deleteRestaurant', {id:@id_restaurant[:id]}, :'X-AUTH-TOKEN'=>@id_token[:id])
      expect(restaurant.code).to match(200) 
    end
    end

context "Delete newly added user" do
    it "admin deletes newly added user sucessfully" do
      restaurant= RestClient.post(url+'/admin/deleteUser', {id:@id_user[:id]}, :'X-AUTH-TOKEN'=>@id_token[:id])
      expect(restaurant.code).to match(200) 
    end
    end

context "Logout admin user" do
    it "admin logged out sucessfully" do
      logout= RestClient.get(url+'/logout', :'X-AUTH-TOKEN'=>@id_token[:id])
      expect(logout.code).to match(200) 
    end
    end
end

