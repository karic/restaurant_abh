require './spec_helper'

email = "irfankr91@gmail.com"
password = "12345"
restaurant_name= "Sufis"
hour= "10:00 PM"
how_many_people = "3 people"
people= how_many_people.split.first

describe "Reserve now mandatory fields and valid reservation" do

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

context "Fill in restaurant name in Search" do
    it "restaurant found sucessfully" do
      reserve.fill_in_restaurant_name(restaurant_name)
      restaurants_header= reserve.click_on_search_button(restaurant_name)
      expect(restaurants_header).to eq(restaurant_name)
    end
  end

context "Click on Reserve now button" do
    it "reserve now form opened successfully" do
      reserve_now= reserve.click_on_reserve_now(restaurant_name)
      expect(reserve_now).to eq(restaurant_name)
    end
  end

context "Enter values for all fields except how many people" do
    it "fails to find a table successfully" do
      reserve.pick_hour(hour)
      error_message = reserve.click_on_find_a_table_button_empty_mandatory_field_reserve_now
      expect(error_message).to eq("All fields are required!")
    end
  end

context "Enter values for all fields except pick hour" do
    it "fails to find a table successfully" do
      reserve.pick_how_many_people(how_many_people)
      reserve.clear_existing_content(hour)
      error_message = reserve.click_on_find_a_table_button_empty_mandatory_field_reserve_now
      expect(error_message).to eq("All fields are required!")
    end
  end

  context "Fill in pick how many people, date and hour" do
    it "reservation fill and find a table click successfully" do
      reserve.pick_hour(hour)
      find_a_table_button= reserve.click_on_find_a_table_button_reserve_now
      expect(find_a_table_button).to match(/Select the best time that fits you/i)
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
     expect(cancel_reservation).to eq("Reservation canceled!\nNo reservations")
    end
  end

end
  