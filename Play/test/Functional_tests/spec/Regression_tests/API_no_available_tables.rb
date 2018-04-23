require 'rest-client'
require 'json'
require './setup_browser'

setup = SetupBrowser.new

url = setup.domain.to_s + ":" + setup.port.to_s + setup.apiversion.to_s

describe "API negative test: reserve a restaurant with no available tables" do

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

context "Add new location" do
    it "admin adds new location sucessfully" do
      #puts @id_token[:id]
      location= RestClient.post(url+'/admin/addLocation', {name:'Sarajevo'}, :'X-AUTH-TOKEN'=>@id_token[:id])
      parsed = JSON.parse(location.body)
      @id_location[:id]= parsed['id']
      expect(location.code).to match(200)
      expect(parsed['name']).to match (/Sarajevo/i)
      end
    end

context "Add new category" do
    it "admin adds new category sucessfully" do
      category= RestClient.post(url+'/admin/addCategory', {name:'Bosnian'}, :'X-AUTH-TOKEN'=>@id_token[:id])
      parsed = JSON.parse(category.body)
      @id_category[:id]= parsed['id']
      expect(category.code).to match(200)
      expect(parsed['name']).to match (/Bos/i)
      end
    end

context "Add new restaurant" do
    it "admin adds new restaurant sucessfully" do
    restaurant= RestClient.post(url+'/admin/addRestaurant', {"longitude":0,"latitude":25,"restaurantName":"Restaurant test","priceRange":2,"location":3005,"description":"Great food","imageFileName":"assets/images/restaurant_logo­e059c3ec2f71d19b1d67f0d80acb45bb.jpg","coverFileName":"assets/images/restaurant_cover­53bb94de27cf68e4efdddd83ac7c8a84.jpg","categories":[@id_category[:id]]}, :'X-AUTH-TOKEN'=>@id_token[:id])
      parsed = JSON.parse(restaurant.body)
      @id_restaurant[:id]= parsed['id']
      expect(restaurant.code).to match(200)
      expect(parsed['restaurantName']).to match (/Restaurant test/i)
	  expect(parsed['description']).to match (/Great food/i)     
	  end
  end

# context "Add table to existing restaurant" do
#     it "admin adds table to new restaurant sucessfully" do
#     restaurant= RestClient.post(url+'/admin/adminTableItems', {"addQueue":[{"sittingPlaces":"15"}],"editQueue":[],"deleteQueue":[],"idRestaurant":"3001"}, :'X-AUTH-TOKEN'=>@id_token[:id])
#     puts restaurant
#     expect(restaurant.code).to match(200)    
# 	  end
#   end

# context "Get all tables for existing restaurant" do
#     it "admin gets tables for new restaurant sucessfully" do
#       restaurant= RestClient.post(url+'/admin/getAllRestaurantTables', {"idRestaurant":"3001"}, :'X-AUTH-TOKEN'=>@id_token[:id])
#       parsed = JSON.parse(restaurant.body)
#       puts "------"
#       puts parsed
#       @id_table[:id]= parsed[0]['id']
#       puts @id_table[:id]
#       expect(restaurant.code).to match(200)    
#     end
#   end

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

context "Check a reservation availability" do
    it "no available tables" do
      body = begin
      RestClient.post(url+'/checkReservationAvailability', {"people":"3 people","date":"Jul 14, 2018","hour":"01:00 PM","idRestaurant":@id_restaurant[:id]},:'X-AUTH-TOKEN'=>@id_token_user[:id])
      rescue => e
      e.response.body
      end
      parsed = JSON.parse(body)
      expect(parsed['error']).to match(/No available tables!/i)
      end
    end

context "Make a reservation" do
    it "no available tables" do
      body = begin
      RestClient.post(url+'/makeReservation', {"persons":"2 people","reservationDate":"Apr 21, 2018","reservationHour":"11:00 AM","idRestaurant":@id_restaurant[:id]}, :'X-AUTH-TOKEN'=>@id_token_user[:id])
      rescue => e
      e.response.body
      end
      parsed = JSON.parse(body)
      expect(parsed['error']).to match(/No available tables!/i)
      end
    end

# context "Make a reservation" do
#     it "reservation in sucessfully" do
#       reserve= RestClient.post(url+'/makeReservation', {"persons":"2 people","reservationDate":"Apr 21, 2018","reservationHour":"11:00 AM","idRestaurant":"3002"}, :'X-AUTH-TOKEN'=>@id_token_user[:id])
#       parsed = JSON.parse(reserve.body)
#       puts parsed
#       @id_reservation[:id] = parsed['id']
#       expect(reserve.code).to match(200)
#       expect(parsed['persons']).to be 2 
#       end
#     end

# context "Cancel a reservation" do
#     it "reservation is canceled sucessfully" do
#       reserve= RestClient.post(url+'/cancelReservation', {idReservation:@id_reservation[:id]}, :'X-AUTH-TOKEN'=>@id_token_user[:id])
#       parsed = JSON.parse(reserve.body)
#       expect(reserve.code).to match(200)
#       end
#     end


context "Delete newly added location" do
    it "admin deletes newly added location sucessfully" do
      restaurant= RestClient.post(url+'/admin/deleteLocation', {id:@id_location[:id]}, :'X-AUTH-TOKEN'=>@id_token[:id])
      expect(restaurant.code).to match(200) 
	  end
  end

context "Delete newly added category" do
    it "admin deletes newly added category sucessfully" do
      restaurant= RestClient.post(url+'/admin/deleteCategory', {id:@id_category[:id]}, :'X-AUTH-TOKEN'=>@id_token[:id])
      expect(restaurant.code).to match(200) 
	  end
    end

# context "Delete table to new restaurant" do
#     it "admin deletes table to new restaurant sucessfully" do
#     restaurant= RestClient.post(url+'/admin/adminTableItems', {"addQueue":[],"editQueue":[],"deleteQueue":[{"id":@id_table[:id]}],"idRestaurant":"3001"}, :'X-AUTH-TOKEN'=>@id_token[:id])
#       parsed = JSON.parse(restaurant.body)
#       expect(restaurant.code).to match(200)    
#     end
#     end

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

