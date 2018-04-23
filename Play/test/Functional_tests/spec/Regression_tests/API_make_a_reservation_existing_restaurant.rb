require 'rest-client'
require 'json'
require './setup_browser'

setup = SetupBrowser.new

url = setup.domain.to_s + ":" + setup.port.to_s + setup.apiversion.to_s

describe "API test: make a reservation in existing restaurant" do

before(:all) do 
  @id_token = { :id=>"" }
  @id_location = { :id=>"" }
  @id_category = { :id=>"" }
  @id_restaurant = { :id=>"" }
  @id_user = { :id=>"" }
  @id_token_user = { :id=>"" }
  @id_table = { :id=>"" }
  @id_reservation = { :id=>"" }
end

context "Log in as admin user" do
    it "admin user logs in sucessfully" do
      login= RestClient.post(url+'/login', {email:setup.email.to_s,password:setup.password.to_s, rememberMe:setup.rememberMe.to_s})
      parsed = JSON.parse(login.body)
      id_admin_user= parsed['id']
      @id_token[:id]= parsed['token']
      expect(login.code).to match(200)
      expect(parsed['email']).to match (/irfankr91@gmail.com/i)
      expect(parsed['firstName']).to match (/Irfan/i) 
      expect(parsed['lastName']).to match (/Krijestorac/i)
      end
    end

context "Register a new user" do
    it "new user registered successfully" do
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
    it "user logs in successfully" do
      login= RestClient.post(url+'/login', {email:'noviuserxx@gmail.com',password:'10062016', rememberMe:'false'})
      parsed = JSON.parse(login.body)
      id_current= parsed['id']
      @id_token_user[:id]= parsed['token']
      expect(login.code).to match(200)
      expect(id_current.to_s === @id_user[:id].to_s).to be true 
      end
    end

context "Search for a restaurant" do
    it "restaurant found succesfully" do
      reserve= RestClient.post(url+'/getRestaurantsByFilter', {"itemsPerPage":6,"pageNumber":"1","searchText": "Baja Fresh"}, :'X-AUTH-TOKEN'=>@id_token_user[:id])
      parsed = JSON.parse(reserve.body)
      @id_restaurant[:id] = parsed['restaurants'][0]['id']
      expect(reserve.code).to match(200)
      expect(parsed['restaurants'][0]['restaurantName']).to match(/Baja Fresh/i)
      end
    end

context "Make a reservation" do
    it "reservation in sucessfully" do
      reserve= RestClient.post(url+'/makeReservation', {"persons":"2 people","reservationDate":"Apr 21, 2018","reservationHour":"11:00 AM","idRestaurant":@id_restaurant[:id]}, :'X-AUTH-TOKEN'=>@id_token_user[:id])
      parsed = JSON.parse(reserve.body)
      @id_reservation[:id] = parsed['id']
      expect(reserve.code).to match(200)
      expect(parsed['persons']).to be 2 
      end
    end

context "Get list of reservations for current user" do
    it "new reservation is succesfully added" do
      reserve= RestClient.get(url+'/getListOfReservationsForUser', :'X-AUTH-TOKEN'=>@id_token_user[:id])
      parsed = JSON.parse(reserve.body)
      expect(reserve.code).to match(200)
      expect(parsed[0]['restaurantName']).to match(/Baja Fresh/i) 
      end
    end

context "Cancel a reservation" do
    it "reservation is canceled sucessfully" do
      reserve= RestClient.post(url+'/cancelReservation', {idReservation:@id_reservation[:id]}, :'X-AUTH-TOKEN'=>@id_token_user[:id])
      parsed = JSON.parse(reserve.body)
      expect(reserve.code).to match(200)
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

