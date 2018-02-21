require './spec_helper'

email = "irfankr91@gmail.com"
password = "12345"
user_email="berina.avdicvx@gmail.com"
restaurant_name= "Restoran test"
price_range= "Rank 3"
new_price_range= "Rank 4"
category= "American"
location= "Chicago"
description= "Restoran test is newly opened restaurant in New York serving typical American couisine."
menu_name= "Frittata" 
new_menu_name= "Frittata vege"
menu_description= "Eggs with vegetables" 
menu_price= "6"
sitting_places= "3"
new_sitting_places= "4"

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

context "Edit desired restaurant " do
    it "open edit form for restaurant" do
      admin.click_on_administration_restaurants
      edit_restaurants= admin.click_on_edit_restaurant_icon(restaurant_name)
      expect(edit_restaurants).to match(/save info/i)
    end
  end

  context "Edit desired restaurant with new price range " do
    it "edit restaurant with new price range value" do
      edit_restaurants= admin.edit_new_restaurant_price_range(new_price_range)
      expect(edit_restaurants).to match(/successful update/i)
    end
  end

context "Click on Menu" do
    it "open Menu page" do
    menu=admin.click_on_menu_button
    expect(menu).to match(/Breakfast/i)
    end
  end

  context "Add new menu item" do
    it "Fill Name, Description, and Price, then click Add and Save" do
      prev= admin.find_all_table_elements
      admin.fill_in_dish_name(menu_name)
      admin.fill_in_dish_description(menu_description)
      admin.fill_in_dish_price(menu_price)
      admin.click_on_add_dish_button
      admin.click_on_save_dish_button
      nex= admin.find_all_table_elements
      fin= nex.length - prev.length
      expect(fin).to be >=1
    end
  end

  context "Edit exisitng table (menu_name) for restaurant" do
    it "exisiting table is edited" do
      edit_menu= admin.edit_existing_menu_item(menu_name, new_menu_name)
      expect(edit_menu).to match(/sucessfully edited/i)
    end
  end

  context "Delete exisiting menu item" do
    it "Clicks on bin icon and Saves" do
      prev= admin.find_all_table_elements
      admin.click_on_bin_dish_icon
      admin.click_on_save_dish_button
      nex= admin.find_all_table_elements
      fin= nex.length - prev.length
      expect(fin).to be <=-1

    end 
  end 

context "Click on table within edit restaurants" do
    it "table page is displayed" do
      table= admin.click_on_tables_tab
      expect(table).to match(/add/i)
    end
  end

context "Add new table (sitting places) for restaurant" do
    it "new table is added" do
      prev= admin.find_all_table_elements
      admin.add_new_table(sitting_places)
      nex= admin.find_all_table_elements
      add_table= nex.length-prev.length
      expect(add_table).to be >=1
    end
  end

context "Edit exisitng table (sitting places) for restaurant" do
    it "exisiting table is edited" do
      edit_table= admin.edit_existing_table(sitting_places, new_sitting_places)
      expect(edit_table).to match(/sucessfully edited/i)
    end
  end

context "Delete existing table (sitting places) for restaurant" do
    it "exisiting table is deleted" do
      prev= admin.find_all_table_elements
      admin.delete_existing_table(new_sitting_places)
      nex= admin.find_all_table_elements
      delete_table= nex.length-prev.length
      expect(delete_table).to be <=-1
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
      delete_users= admin.click_on_delete_existing_user(user_email)
      expect(delete_users).to match(/successful remove/i)
    end
  end

context "Click on logout from first name dropwon " do
  it "user logged out successfully" do
    main.click_on_navigation_home
    logout= main.click_on_logout
    expect(logout).to match(/login/i)
  end
end

end