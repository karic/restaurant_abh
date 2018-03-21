require './spec_helper'

email = "irfankr91@gmail.com"
password = "12345"
restaurant_name= "Pasta n Pizza"
rate_stars="5 stars"
rate_stars_= rate_stars.split.first.to_i
comment= "I think this is fantastic restaurant!"

describe "Add and view reviews for exisitng restaurant" do

  let(:main) { @homepage.get_main }
  let(:login) { @homepage.get_main.get_login }
  let(:reserve) { @homepage.get_main.get_reserve }
  let(:review) { @homepage.get_main.get_review }


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

context "Select desired restaurant to rate" do
    it "opens restaurants page" do
      restaurants_header= review.click_on_restaurant_name(restaurant_name)
      expect(restaurants_header).to eq(restaurant_name)
      end
    end

context "Click on rate this place" do
    it "opens rate this place window successfully" do
      rate= review.click_on_rate_this_place_button
      expect(rate).to eq('Rate this place')
      end
    end

context "Fill in rate stars, commment and click Rate button" do
    it "Restaurant rated successfully" do
      review.select_stars(rate_stars_)
      review.enter_comment(comment)
      click= review.click_on_rate_this_place
      expect(click).to eq 1
      end
    end

context "Click on rate this place" do
    it "Opens rate this place window successfully" do
      rate= review.click_on_rate_this_place_button
      expect(rate).to eq('Rate this place')
      end
    end

context "Fill in rate stars, commment and click Rate button" do
    it "Restaurant rated successfully" do
      review.select_stars(rate_stars_)
      review.enter_comment(comment)
      click= review.click_on_rate_this_place_with_existing_rate
      expect(click).to be true
      end
    end
end
  