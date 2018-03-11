require './spec_helper'

email = "irfankr91@gmail.com"
password = "12345"
price_range= "Rank 3"
price= price_range.split.last
rating_stars="3 stars"
rating=rating_stars.split.first
cousine= "American"
restaurant_name= "Dummy restaurant"
location= "Chicago"

describe "Search and filter by functionalities" do

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

context "Fill in invalid restaurants name in search bar" do
    it "No restaurants found message" do
      reserve.fill_in_restaurant_name(restaurant_name)
      search_button= reserve.click_on_search_button_no_restaurant
      expect(search_button).to eq('No restaurants found!')
    end
  end

context "Clear exisitng entry and click on Filter by" do
    it "Filters displayed sucessfully" do
      search_button=reserve.clear_search_entry
      restaurants_header= reserve.click_on_filter_by
      expect(restaurants_header).to eq('PRICE')
    end
  end

context "Click on Price range" do
    it "Restaurants filtered sucessfully" do
      restaurants_header= reserve.click_on_dollars_sign(price)
      expect(restaurants_header).to eq(price.to_i)
    end
  end

context "Click on Rating" do
    it "Restaurants filtered sucessfully" do
      restaurants_header= reserve.click_on_rating_stars(rating)
      #Rating has to be at least rating
      expect(restaurants_header).to be >= rating.to_i
    end
  end

context "Click on Cousine" do
    it "Restaurants filtered sucessfully" do
      restaurants_header= reserve.click_on_cousine(cousine)
      expect(restaurants_header).to eq(true)
    end
  end
end
  