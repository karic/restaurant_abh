require './spec_helper'

email = "irfankr91@gmail.com"
password = "12345"
restaurant_name= "Restoran test"
price_range= "Rank 3"
new_price_range= "Rank 4"
category= "Bosniana"
location= "Baltimore"
description= "Restoran test is newly opened restaurant in Baltimore serving typical Bosnian couisine."

describe "Add new location, couisine and create restaurant with them" do

let(:main) { @homepage.get_main }
let(:admin) { @homepage.get_main.get_admin }
let(:login) { @homepage.get_main.get_login }

  context "Click on login in navigation" do
    it "opens login page" do
      login_header= login.click_on_navigation_login
      expect(login_header).to match(/login/i) 
      end
    end

  context "Fill in valid email, password and click login" do
    it "login fill and click successfully" do
      login.fill_in_email(email)
      login.fill_in_password(password)
      login_check= login.click_on_login_button
      expect(login_check).not_to match(/login/i)
    end
  end

  context "Navigate to Administration" do
    it "navigate and opened Administration page sucessfully" do
      administration= main.click_on_navigation_administration
      expect(administration).not_to match(/restaurants/i)
    end
  end

context "Click on tab Categories" do
  it "Categories page is opened successfully" do
    users= admin.click_on_administration_categories
    expect(users).to match(/add categories/i)
  end
end

context "Click on add categories button" do
  it "Add categories page is opened successfully" do
    users= admin.click_on_add_categories_button
    expect(users).to match(/add category/i)
  end
end

context "Add new category" do
  it "New category added successfully" do
    categ= admin.add_new_category(category)
    expect(categ).to match(/successful insert/i)
  end
end

context "Click on tab Locations" do
  it "Locations page is opened successfully" do
    users= admin.click_on_administration_locations
    expect(users).to match(/add locations/i)
  end
end

context "Click on add locations button" do
  it "Add locations page is opened successfully" do
    users= admin.click_on_add_locations_button
    expect(users).to match(/add location/i)
  end
end

context "Add new location" do
  it "New location added successfully" do
    locat= admin.add_new_location(location)
    expect(locat).to match(/successful insert/i)
  end
end

context "Navigate to Restaurants" do
    it "navigate and opened Restaurants page sucessfully" do
      restaurants= admin.click_on_administration_restaurants
      expect(restaurants).to match(/add restaurants/i)
    end
  end

context "Click on add restaurants button" do
   it "navigate and opened Restaurants page sucessfully" do
    add_restaurants= admin.click_on_add_restaurants_button
     expect(add_restaurants).to match(/add restaurant/i)
   end
  end

context "Fill in valid restaurant name, description, price range, location, category and click add restaurant" do
    it "add restaurant form fill and new restaurant added sucessfully" do
      #admin.upload_logo_image
      admin.fill_in_restaurant_name(restaurant_name)
      admin.fill_in_description(description)
      admin.select_price_range(price_range)
      admin.select_location(location)
      admin.select_category(category)
      add_rest= admin.click_on_add_restaurant_button
      save=admin.click_on_save_info_button
      expect(add_rest).to match(/successful insert/i)
      expect(save).to match(/successful update/i)
    end
  end

context "Click on logout from first name dropwon " do
  it "user logged out successfully" do
    logout= main.click_on_logout
    expect(logout).to match(/login/i)
  end
end

end