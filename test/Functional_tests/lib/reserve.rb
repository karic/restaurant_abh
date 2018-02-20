class Reserve < Main
  
  def fill_in_restaurant_name(restaurant_name)
    @session.within(:find_a_table_area) do
      @session.fill_in('Search for a restaurant...', with: restaurant_name)
    end
  end

  def pick_how_many_people(how_many_people)
    @session.within(:find_a_table_area) do
      dropdown= @session.driver.browser.find_element(:xpath,"//div[contains(@data-value,'2 people')]")
      dropdown= dropdown.find_element(:xpath,"..");
      dropdown= dropdown.find_element(:xpath,"..");
      dropdown= dropdown.find_element(:xpath,"..");
      dropdown.click
      people= dropdown.find_element(:xpath,"//div[contains(@data-value,'#{how_many_people}')]").click
    end
  end 

def pick_hour(pick_hour)
    @session.within(:find_a_table_area) do
    hours= @session.driver.browser.find_element(:xpath,"//div[contains(@data-value,'10:00 PM')]")
    hours= hours.find_element(:xpath,"..");
    hours= hours.find_element(:xpath,"..");
    hours= hours.find_element(:xpath,"..");
    hours.click
    hours= hours.find_element(:xpath,"//div[contains(@data-value,'#{pick_hour}')]").click
    end
  end

  def click_on_find_a_table_button
    @session.within(:find_a_table_area) do
      @session.click_button('Find a table')
     @session.driver.browser.find_element(:css,"div.title").text
    end
  end

def click_on_time_slot(hour)
    @session.within(:time_slots_area) do
      @session.driver.browser.find_element(:css,"div.reservation_choose_time > a").click
      #c=b.text
      #if c== hour then b.click end
        @session.driver.browser.find_element(:css,"h1.complete_reservation_title").text 
end
end

def click_on_complete_reservation_button
  @session.within(:complete_reservation_area) do
    @session.click_button('Complete reservation')
wait = Selenium::WebDriver::Wait.new(:timeout => 4)
input = wait.until {
    element= @session.driver.browser.find_element(:css,"div.alertText")
    element if element.displayed?
}  
input.text 
end  
end

def click_on_cancel_reservation_button(restaurant_name, peoplenm)
  @session.within(:cancel_reservation_area) do
  cancel_reservation= @session.driver.browser.find_element(:css,"div.box_shadow.restaurant_data_container")
  name= cancel_reservation.find_element(:css,"div.col-md-10.complete_reservation_restaurant_details > div.name").text
  people= cancel_reservation.find_element(:css,"div.col-md-10.complete_reservation_restaurant_details > div.row > div.col-md-2 > div.details").text
  #hour=cancel_reservation.find_element(:css,"div.col-md-10.complete_reservation_restaurant_details > div > div > div").text 
  if name==restaurant_name and people==peoplenm then @session.click_button('Cancel reservation') end
  @session.driver.browser.find_element(:css, "div.alertText").text
  end
end

end

