require './spec_helper'

email = "irfankr91@gmail.com"
password = "12345"
restaurant_name= "Baja Fresh"
how_many_people= "6 people"
people="6"
hour= "07:00 PM"

describe "Administration of restaurant" do

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

context "Edit desired restaurant " do
    it "open edit form for restaurant" do
      edit_restaurants= admin.click_on_edit_restaurant_icon(restaurant_name)
      expect(edit_restaurants).to match(/save info/i)
    end
  end

#context "Fill in valid restaurant name, description, price range, location, category and click add restaurant" do
 #   it "Add restaurant form fill and new restaurant added sucessfully" do
  #    admin.fill_in_restaurant_name(restaurant_name)
      #login_check= login.click_on_login_button
      #expect(login_check).not_to match(/login/i)
   # end
  #end

#context "Click on logout from first name dropwon " do
 #  it "user logged out successfully" do
  # logout= main.click_on_logout
   #expect(logout).to match(/login/i)
    #end
  #end

end