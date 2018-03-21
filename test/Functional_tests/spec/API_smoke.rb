require 'rest-client'
require 'json'

domain="http://ec2-18-194-88-22.eu-central-1.compute.amazonaws.com"
port="9000"
apiversion="/api/v1"
url=domain+":"+port+apiversion
describe "API smoke test" do

context "Log in as admin user" do
    it "admin user logs in sucessfully" do
      login= RestClient.post(url+'/login', {email:'irfankr91@gmail.com',password:'12345', rememberMe:'false'})
      parsed = JSON.parse(login.body)
      id_admin_user= parsed['id']
      $id_token= parsed['token']
      expect(login.code).to match(200)
      expect(parsed['email']).to match (/irfankr91@gmail.com/i)
      expect(parsed['firstName']).to match (/Irfan/i)	
   	  expect(parsed['lastName']).to match (/Krijestorac/i)
      end
    end

context "Add new location" do
    it "admin adds new location sucessfully" do
      location= RestClient.post(url+'/admin/addLocation', {name:'Sarajevo'}, :'X-AUTH-TOKEN'=>$id_token)
      parsed = JSON.parse(location.body)
      $id_location= parsed['id']
      expect(location.code).to match(200)
      expect(parsed['name']).to match (/Sarajevo/i)
      end
    end

context "Add new category" do
    it "admin adds new category sucessfully" do
      category= RestClient.post(url+'/admin/addCategory', {name:'Bosnian'}, :'X-AUTH-TOKEN'=>$id_token)
      parsed = JSON.parse(category.body)
      $id_category= parsed['id']
      expect(category.code).to match(200)
      expect(parsed['name']).to match (/Bos/i)
      end
    end

context "Add new restaurant" do
    it "admin adds new restaurant sucessfully" do
    restaurant= RestClient.post(url+'/admin/addRestaurant', {"longitude":0,"latitude":25,"restaurantName":"Restoran test","priceRange":2,"location":3005,"description":"Great food","imageFileName":"assets/images/restaurant_logo­e059c3ec2f71d19b1d67f0d80acb45bb.jpg","coverFileName":"assets/images/restaurant_cover­53bb94de27cf68e4efdddd83ac7c8a84.jpg","categories":[$id_category]}, :'X-AUTH-TOKEN'=>$id_token)
      parsed = JSON.parse(restaurant.body)
      $id_restaurant= parsed['id']
      expect(restaurant.code).to match(200)
      expect(parsed['restaurantName']).to match (/Restoran test/i)
	  expect(parsed['description']).to match (/Great food/i)     
	  end
  end

context "Add table to new restaurant" do
    it "admin adds table to new restaurant sucessfully" do
    restaurant= RestClient.post(url+'/admin/adminTableItems', {addQueue:[{sittingPlaces:22}],editQueue:[],deleteQueue:[],idRestaurant:$id_restaurant}, :'X-AUTH-TOKEN'=>$id_token)
    expect(restaurant.code).to match(200)    
	  end
  end

context "Get all tables for new restaurant" do
    it "admin gets tables for new restaurant sucessfully" do
    restaurant= RestClient.post(url+'/admin/getAllRestaurantTables', {idRestaurant:$id_restaurant}, :'X-AUTH-TOKEN'=>$id_token)
      parsed = JSON.parse(restaurant.body)
      puts "------"
      puts parsed
      $id_table= parsed[0]['id']
      expect(restaurant.code).to match(200)    
    end
  end

context "Edit newly added restaurant" do
    it "admin edits newly added restaurant sucessfully" do
      restaurant= RestClient.post(url+'/admin/editRestaurant', {"id":$id_restaurant, "longitude":0,"latitude":25,"restaurantName":"Restoran test novi","priceRange":3,"location":3005,"description":"Great food","imageFileName":"assets/images/restaurant_logo­e059c3ec2f71d19b1d67f0d80acb45bb.jpg","coverFileName":"assets/images/restaurant_cover­53bb94de27cf68e4efdddd83ac7c8a84.jpg","categories":[$id_category]}, :'X-AUTH-TOKEN'=>$id_token)
      parsed = JSON.parse(restaurant.body)
      expect(restaurant.code).to match(200)
      expect(parsed['restaurantName']).to match (/Restoran test novi/i)
	    expect(parsed['priceRange']).to be 3     
	  end
  end

context "Register a new user" do
    it "new user registered sucessfully" do
	  register= RestClient.post(url+'/register', {email:'noviuser3@gmail.com',firstName:'Novi',lastName:'Korisnik',Phone:'13215156',country:'BiH',city:'Maglaj',password:'10062016'})
	  parsed = JSON.parse(register.body)
	  $id_user= parsed['id']
    expect(register.code).to match(200)
	  expect(parsed['firstName']).to match(/Novi/i)
    expect(parsed['lastName']).to match(/Korisnik/i)
	  expect(parsed['email']).to match(/noviuser3@gmail.com/i)
    end
  end

context "Log in user" do
    it "user logs in sucessfully" do
      login= RestClient.post(url+'/login', {email:'noviuser3@gmail.com',password:'10062016', rememberMe:'false'})
      parsed = JSON.parse(login.body)
      id_current= parsed['id']
      $id_token_user= parsed['token']
      expect(login.code).to match(200)
      expect(id_current.to_s === $id_user.to_s).to be true 
      end
    end

context "Make a reservation" do
    it "reservation in sucessfully" do
      reserve= RestClient.post(url+'/makeReservation', {persons:'3 people',reservationDate:'Jul 18, 2018',reservationHour:'10:30 AM',idRestaurant:$id_restaurant}, :'X-AUTH-TOKEN'=>$id_token_user)
      parsed = JSON.parse(reserve.body)
      $id_reservation= parsed['id']
      expect(reserve.code).to match(200)
      expect(parsed['persons']).to be 3 
      end
    end

context "Cancel a reservation" do
    it "reservation is canceled sucessfully" do
      reserve= RestClient.post(url+'/cancelReservation', {idReservation:$id_reservation}, :'X-AUTH-TOKEN'=>$id_token_user)
      parsed = JSON.parse(reserve.body)
      expect(reserve.code).to match(200)
      end
    end

context "Delete newly added location" do
    it "admin deletes newly added location sucessfully" do
      restaurant= RestClient.post(url+'/admin/deleteLocation', {id:$id_location}, :'X-AUTH-TOKEN'=>$id_token)
      expect(restaurant.code).to match(200) 
	  end
  end

context "Delete newly added category" do
    it "admin deletes newly added category sucessfully" do
      restaurant= RestClient.post(url+'/admin/deleteCategory', {id:$id_category}, :'X-AUTH-TOKEN'=>$id_token)
      expect(restaurant.code).to match(200) 
	  end
    end

context "Delete table to new restaurant" do
    it "admin deletes table to new restaurant sucessfully" do
    restaurant= RestClient.post(url+'/admin/adminTableItems', {addQueue:[],editQueue:[],deleteQueue:[{id:$id_table}],idRestaurant:$id_restaurant}, :'X-AUTH-TOKEN'=>$id_token)
      parsed = JSON.parse(restaurant.body)
      expect(restaurant.code).to match(200)    
    end
    end
context "Delete newly added restaurant" do
    it "admin deletes newly added restaurant sucessfully" do
      restaurant= RestClient.post(url+'/admin/deleteRestaurant', {id:$id_restaurant}, :'X-AUTH-TOKEN'=>$id_token)
      expect(restaurant.code).to match(200) 
	  end
    end

context "Delete newly added user" do
    it "admin deletes newly added user sucessfully" do
      restaurant= RestClient.post(url+'/admin/deleteUser', {id:$id_user}, :'X-AUTH-TOKEN'=>$id_token)
      expect(restaurant.code).to match(200) 
	  end
    end

context "Logout admin user" do
    it "admin logged out sucessfully" do
      logout= RestClient.get(url+'/logout', :'X-AUTH-TOKEN'=>$id_token)
      expect(logout.code).to match(200) 
	  end
    end
end

