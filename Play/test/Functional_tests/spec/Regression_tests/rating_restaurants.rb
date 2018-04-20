require './spec_helper'


email = "irfankr91@gmail.com"
password = "12345"

first_name= "Berina"
last_name= "Avdic"
email_new = "berina.avdicvx@gmail.com"
password_new = "restoran"
phone= "061546765"
country= "Bosnia and Herzegovina"
city= "Sarajevo"

restaurant_name= "Restaurant test"
price_range= "Rank 3"
new_price_range= "Rank 4"
category= "American"
location= "Chicago"
description= "Restoran test is newly opened restaurant in New York serving typical American couisine."
rate_stars="5 stars"
rate_stars_= rate_stars.split.first.to_i
comment= "I think this is fantastic restaurant!"

describe "Add and view reviews for exisitng restaurant" do

let(:admin) { @homepage.get_main.get_admin }
let(:main) { @homepage.get_main }
let(:login) { @homepage.get_main.get_login }
let(:reserve) { @homepage.get_main.get_reserve }
let(:review) { @homepage.get_main.get_review }
let(:register) { @homepage.get_main.get_register}



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
      sleep(2)
      administration= main.click_on_navigation_administration
      expect(administration).not_to match(/restaurants/i)
    end
  end

context "Navigate to Restaurants" do
    it "navigate and opened Restaurants page sucessfully" do
      sleep(2)
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

context "Click on login in navigation" do
    it "opens login page" do
      login_header= login.click_on_navigation_login
      expect(login_header).to match(/login/i) 
      end
    end

context "Click on create account on login page" do
    it "opens create account form" do
      sleep(1)
      create_account = register.click_on_create_account
      expect(create_account).to match(/create account/i)
    end
  end

  context "Fill in valid registration data and register new user" do
    it "register form filled successfully" do
      register.fill_in_first_name(first_name)
      register.fill_in_last_name(last_name)
      register.fill_in_email(email_new)
      register.fill_in_phone(phone)
      register.select_country(country)
      register.select_city(city)
      register.fill_in_password(password_new)
      register.fill_in_confirm_password(password_new)
      register_check= register.click_on_create_account_button
      expect(register_check).not_to match('Login')
    end
  end

context "Navigation to Restaurants page" do
     it "opens restaurants page" do
       sleep(1)
       restaurants_header= main.click_on_navigation_restaurants
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

context "Click on logout from first name dropwon " do
   it "user logged out successfully" do
     logout= main.click_on_logout
     expect(logout).to match(/login/i)
    end
  end

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

context "Delete desired restaurant " do
    it "desired restaurant is deleted" do
      admin.click_on_administration_restaurants
      delete_restaurants= admin.click_on_delete_restaurant_icon(restaurant_name)
      expect(delete_restaurants).to match(/successful remove/i)
    end
  end

context "Click on tab Users" do
  it "selected user is deleted" do
    users= admin.click_on_administration_users
    expect(users).to match(/add users/i)
  end
end

context "Delete desired user " do
    it "desired user is deleted" do
      admin.click_on_administration_users
      delete_users= admin.click_on_delete_existing_user(email_new)
      expect(delete_users).to match(/successful remove/i)
    end
  end

context "Click on logout from first name dropwon " do
   it "user logged out successfully" do
     logout= main.click_on_logout
     expect(logout).to match(/login/i)
    end
  end

end
  