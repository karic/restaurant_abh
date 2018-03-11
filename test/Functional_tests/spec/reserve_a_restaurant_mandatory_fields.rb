require './spec_helper'

email = "irfankr91@gmail.com"
password = "12345"
restaurant_name= "Sufis"
hour= "10:00 PM"
how_many_people = "6 people"

describe "Find a table mandatory fields" do

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

context "Click on home in navigation" do
    it "opens home page" do
      home_header= main.click_on_navigation_home
      expect(home_header).to match(/make a free reservation/i)
      end
    end

context "Enter values for all fields except how many people" do
    it "fails to find a table successfully" do
      reserve.fill_in_restaurant_name(restaurant_name)
      reserve.pick_hour(hour)
      error_message = reserve.click_on_find_a_table_button_empty_mandatory_field
      expect(error_message).to eq("How many people field is empty!")
    end
  end

context "Enter values for all fields except pick hour" do
    it "fails to find a table successfully" do
      reserve.fill_in_restaurant_name(restaurant_name)
      reserve.pick_how_many_people(how_many_people)
      #clear_existing_content(hour) should delete already selected hour in pick hour part
      reserve.clear_existing_content(hour)
      error_message = reserve.click_on_find_a_table_button_empty_mandatory_field
      expect(error_message).to eq("Reservation hour field is empty!")
    end
  end
end