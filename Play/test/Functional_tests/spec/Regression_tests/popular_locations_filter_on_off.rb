require './spec_helper'

email = "irfankr91@gmail.com"
password = "12345"
location= "Chicago"

describe "Popular locations filter on and off" do

  let(:main) { @homepage.get_main }
  let(:login) { @homepage.get_main.get_login }
  let(:reserve) { @homepage.get_main.get_reserve }


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

context "Navigation to Restaurants page" do
    it "opens restaurants page" do
      restaurants_header= main.check_reservations_page_open
      expect(restaurants_header).to eq('Search')
      end
    end

context "Click on one of listed location in Popular location section" do
    it "restaurants are sucessfully filtered by location" do
      pop_location= reserve.click_on_popular_location(location)
      expect(pop_location).to eq(true)
      end
    end

context "Click on x location filter in Popular location" do
    it "all restaurants are listed" do
      pop_location= reserve.click_on_x_pop_location(location)
      expect(pop_location).to eq(true)
      end
    end

end
  