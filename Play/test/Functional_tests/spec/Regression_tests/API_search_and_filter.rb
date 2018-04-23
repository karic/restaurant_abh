require 'rest-client'
require 'json'
require './setup_browser'

setup = SetupBrowser.new

url = setup.domain.to_s + ":" + setup.port.to_s + setup.apiversion.to_s

describe "API test: search and filter" do

before(:all) do 
  @id_token = { :id=>"" }
  @id_location = { :id=>"" }
  @id_category = { :id=>"" }
  @id_restaurant = { :id=>"" }
  @id_user = { :id=>"" }
  @id_token_user = { :id=>"" }
  @category_name = { :id=>"" }
  @location_name = { :id=>"" }

end

context "Log in as admin user" do
    it "admin user logs in sucessfully" do
      login= RestClient.post(url+'/login', {email:setup.email.to_s,password:setup.password.to_s, rememberMe:setup.rememberMe.to_s})
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

context "Search for restaurant with invalid restaurant name" do
    it "restaurant not found sucessfully" do
      reserve= RestClient.post(url+'/getRestaurantsByFilter', {"itemsPerPage":6,"pageNumber":"1","searchText":"Dummy restaurant"}, :'X-AUTH-TOKEN'=>$id_token)
      parsed = JSON.parse(reserve.body)
      expect(reserve.code).to match(200)
      expect(parsed['numberOfRestaurantPages']).to be 0
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

context "Search for a newly added restaurant" do
    it "restaurant found succesfully" do
      reserve= RestClient.post(url+'/admin/getFilteredRestaurants', {"itemsPerPage":6,"pageNumber":"1","searchText": "Restaurant test"}, :'X-AUTH-TOKEN'=>@id_token[:id])
      parsed = JSON.parse(reserve.body)
      @category_name[:id]=parsed['restaurants'][0]['foodType']
      @location_name[:id]=parsed['restaurants'][0]['location']
      expect(reserve.code).to match(200)
      expect(parsed['restaurants'][0]['restaurantName']).to match(/Restaurant test/i)
      expect(parsed['restaurants'][0]['id']).to match @id_restaurant[:id]
      end
    end

context "Search for a newly added restaurant's category" do
    it "restaurant found succesfully" do
      reserve= RestClient.post(url+'/admin/getFilteredCategories', {"itemsPerPage":6,"pageNumber":"1","searchText":@category_name[:id]}, :'X-AUTH-TOKEN'=>@id_token[:id])
      parsed = JSON.parse(reserve.body)
      expect(reserve.code).to match(200)
      expect(parsed['categories'][0]['id']).to match @id_category[:id] 
      end
    end

context "Search for a newly added restaurant's location" do
    it "restaurant found succesfully" do
      reserve= RestClient.post(url+'/admin/getFilteredLocations', {"itemsPerPage":6,"pageNumber":"1","searchText":@location_name[:id]}, :'X-AUTH-TOKEN'=>@id_token[:id])
      parsed = JSON.parse(reserve.body)
      expect(reserve.code).to match(200)
      expect(parsed['locations'][0]['id']).to match @id_location[:id] 
      end
    end

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

context "Delete newly added restaurant" do
    it "admin deletes newly added restaurant sucessfully" do
      restaurant= RestClient.post(url+'/admin/deleteRestaurant', {id:@id_restaurant[:id]}, :'X-AUTH-TOKEN'=>@id_token[:id])
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

