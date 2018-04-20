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

def clear_existing_content(hour)
    @session.within(:find_a_table_area) do
    hours= @session.driver.browser.find_element(:xpath,"//div[contains(@data-value,'#{hour}')]")
    hours= hours.find_element(:xpath,"..");
    hours.click
    @session.driver.browser.find_element(:xpath,"//div[@class='selectize-input items has-options full has-items focus input-active dropdown-active']//input").send_keys(:backspace)
  end
end

  def click_on_find_a_table_button
    @session.within(:find_a_table_area) do
      @session.click_button('Find a table')
     @session.driver.browser.find_element(:css,"div.title").text
    end
  end

 def click_on_find_a_table_button_no_restaurant
    @session.within(:find_a_table_area) do
      @session.click_button('Find a table')
      message= @session.driver.browser.find_element(:xpath,"//div[@class=\"alert alert-danger\"]").text.split(/\n/)[1]
    end
  end

def click_on_find_a_table_button_reserve_now
    @session.within(:find_a_table_area) do
      @session.click_button('Find a table')
      message= @session.driver.browser.find_element(:xpath,"//h4[@class='select_time_best_fits']").text
    end
  end

def click_on_search_button_no_restaurant
    @session.within(:find_a_table_area) do
      @session.click_button('Search')
      message= @session.driver.browser.find_element(:xpath,"//div[@class=\"alert alert-danger\"]").text.split(/\n/)[1]
    end
  end

  def clear_search_entry
    @session.within(:find_a_table_area) do
      @session.driver.browser.find_element(:xpath,"//input[@placeholder='Search for a restaurant...']").clear
      @session.click_button('Search')
    end
  end

  def click_on_find_a_table_button_empty_mandatory_field
    @session.within(:find_a_table_area) do
      @session.click_button('Find a table')
      message= @session.driver.browser.find_element(:xpath,"//div[@class=\"alert alert-danger\"]").text.split(/\n/)[1]
    end
  end

  def click_on_find_a_table_button_empty_mandatory_field_reserve_now
    @session.within(:find_a_table_area) do
      @session.click_button('Find a table')
      message= @session.driver.browser.find_element(:xpath,"//div[@class=\"alert alert-danger\"]").text
    end
  end

def click_on_search_button(restaurant_name)
    @session.within(:find_a_table_area) do
      @session.click_button('Search')
      sleep(2)
      res_name= @session.driver.browser.find_element(:xpath,"//div[@class='ember-view restaurantbox']//a[text()='#{restaurant_name}']").text
    end
  end

def click_on_filter_by
    @session.within(:find_a_table_area) do
      sleep(1)
      filter_by= @session.driver.browser.find_element(:xpath,"//span[@class='glyphicon glyphicon-chevron-down arrow_down']")
      @session.driver.browser.action.move_to(filter_by).perform
      filter= @session.driver.browser.find_element(:xpath,"//h4[text()='PRICE']").text
    end
  end

def click_on_dollars_sign(price)
    @session.within(:find_a_table_area) do
      sleep(1)
      filter_by= @session.driver.browser.find_element(:xpath,"//span[text()='$'][#{price}]").click
      prices= @session.driver.browser.find_elements(:xpath,"//span[@class='price_range']")
      length= prices.size
      prices.each do |prices_parts|
        prices_parts= @session.driver.browser.find_elements(:xpath,"//span[@class='price_range']//span[@class='active']")
        @amount= prices_parts.size
    end
    @amount/length
  end
end

def click_on_rating_stars(rating)
    @session.within(:find_a_table_area) do
      sleep(1)
      filter_by= @session.driver.browser.find_element(:xpath,"//img[@src='assets/images/star_inactive-9f47710459b067cc6e4a42ea118ba4df.png'][#{rating}]").click
      prices= @session.driver.browser.find_elements(:xpath,"//div[@class='restaurant_marks']")
      length= prices.size
      prices.each do |prices_parts|
        prices_parts= @session.driver.browser.find_elements(:xpath,"//div[@class='restaurant_marks']//img[@src='assets/images/star_active-7ef89868f1a8043b2e8fcf8970c7b2e8.png']")
        @amount= prices_parts.size
    end
    @amount/length
  end
end

def click_on_cousine(cousine)
    @session.within(:find_a_table_area) do
      sleep(1)
      filter_by= @session.driver.browser.find_element(:xpath,"//a[text()='#{cousine}']").click
      foods= @session.driver.browser.find_elements(:xpath,"//div[@class='restaurant_food']")
      @f=true
      foods.each do |food|
        @f= @f and food.text.split("|").include?(cousine)
  end
  @f
end
end

def click_on_popular_location(location)
    @session.within(:restaurant_page_area) do
      @session.driver.browser.find_element(:xpath,"//div[@class='homepage_location']//a[text()='#{location}']").click
      number_rest= @session.driver.browser.find_element(:xpath,"//a[text()='#{location}']")
      number_rest= number_rest.find_element(:xpath,"..");
      number_rest= number_rest.find_element(:xpath,"//div[@class='details']")
      number_rest= number_rest.text.split.first.to_i
      foods= @session.driver.browser.find_elements(:xpath,"//div[@class='ember-view restaurantbox']")
      how_many= foods.size
      number_rest == how_many
end
end

def click_on_x_pop_location(location)
  @session.within(:restaurant_page_area) do
    foods= @session.driver.browser.find_elements(:xpath,"//div[@class='ember-view restaurantbox']")
    how_many_before= foods.size
    @session.driver.browser.find_element(:xpath,"//div[@class='homepage_location']//a[text()='#{location}']").click
    foods_a= @session.driver.browser.find_elements(:xpath,"//div[@class='ember-view restaurantbox']")
    how_many_after= foods_a.size
    how_many_before <= how_many_after
  end
end

def click_on_reserve_now(restaurant_name)
    @session.within(:reserve_now_area) do
      @session.click_link('Reserve now')
      sleep(2)
      res_name= @session.driver.browser.find_element(:xpath,"//h1[text()='#{restaurant_name}']").text
    end
  end

def click_on_time_slot(hour)
    @session.within(:time_slots_area) do
      @session.driver.browser.find_element(:css,"div.reservation_choose_time > a").click
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
  @session.driver.browser.find_element(:xpath, "//div[@id='main']/div[@class='container']").text  
end
end

end
