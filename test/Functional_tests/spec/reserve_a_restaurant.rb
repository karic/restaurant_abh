require './spec_helper'

email = "berina.avdicvx@gmail.com"
password = "restoran"
restaurant_name= "Sufis"
how_many_people= "6 people"
people= how_many_people.split.first
hour= "07:00 PM"
describe "Reservation of restaurant table" do

let(:main) { @homepage.get_main }
let(:reserve) { @homepage.get_main.get_reserve }
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

context "Click on home in navigation" do
    it "opens home page" do
      home_header= main.click_on_navigation_home
      expect(home_header).to match(/make a free reservation/i)
      end
    end

  context "Fill in valid restaurant name, pick how many people, date and hour" do
    it "reservation fill and find a table click successfully" do
      reserve.fill_in_restaurant_name(restaurant_name)
      reserve.pick_how_many_people(how_many_people)
      #reserve.pick_date(date)
      reserve.pick_hour(hour)
      find_a_table_button= reserve.click_on_find_a_table_button
      expect(find_a_table_button).to match(/RESTAURANT/i)
    end
  end

context "Select time slot and complete reservtion" do
    it "desired time slot selected and complete reservation click successfully" do
      time_slot= reserve.click_on_time_slot(hour)
      expect(time_slot).to match(/complete your reservation/i)
    end
  end

context "Click on complete reservation button" do
   it "complete reservation successfully" do
     complete_reservations= reserve.click_on_complete_reservation_button
     expect(complete_reservations).to match(/reservation is successfull/i)
    end
  end

context "Click on reservations from first name dropwon " do
   it "reservations listed successfully" do
     reservations= main.click_on_reservations_link
     expect(reservations).to match(/reservation details/i)
    end
  end

context "Click on cancel reservations" do
   it "reservations canceled successfully" do
     cancel_reservation= reserve.click_on_cancel_reservation_button(restaurant_name, people)
     expect(cancel_reservation).to match(/reservation canceled/i)
    end
  end
  
context "Click on logout from first name dropwon " do
   it "user logged out successfully" do
     logout= main.click_on_logout
     expect(logout).to match(/login/i)
    end
  end

end