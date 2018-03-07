require './spec_helper'

email = "berina.avdicvx@gmail.com"
password = "restoran"
restaurant_name= "Dummy restoran"
how_many_people= "6 people"
people= how_many_people.split.first
hour= "07:00 PM"
describe "Reservation of restaurant table with not exisiting restaurant name" do

let(:main) { @homepage.get_main }
let(:reserve) { @homepage.get_main.get_reserve }
let(:login) { @homepage.get_main.get_login }

  context "Click on login in navigation" do
    it "Opens login page" do
      login_header= login.click_on_navigation_login
      expect(login_header).to match(/login/i) 
      end
    end

  context "Fill in valid email, password and click login" do
    it "Login fill and click successfully" do
      login.fill_in_email(email)
      login.fill_in_password(password)
      login_check= login.click_on_login_button
      expect(login_check).not_to match(/login/i)
    end
  end

context "Click on home in navigation" do
    it "Opens home page" do
      home_header= main.click_on_navigation_home
      expect(home_header).to match(/make a free reservation/i)
      end
    end

  context "Fill in valid restaurant name, pick how many people, date and hour" do
    it "No available restaurants message" do
      reserve.fill_in_restaurant_name(restaurant_name)
      reserve.pick_how_many_people(how_many_people)
      reserve.pick_hour(hour)
      find_a_table_button= reserve.click_on_find_a_table_button_no_restaurant
      expect(find_a_table_button).to eq('No available restaurants found!')
    end
  end
end