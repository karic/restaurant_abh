class Admin < Main
  
  def click_on_administration_restaurants
    @session.within(:admin_navigation_area) do
    @session.find_link('Restaurants').click
    sleep(1)
    @session.driver.browser.find_element(:xpath,"//div[@class=\"col-md-2\"]/button").text
  end
end

 def click_on_edit_restaurant_icon(restaurant_name)
    @session.within(:restaurants_table_area) do
    edit= @session.driver.browser.find_element(:xpath,"//td[contains(text(),'#{restaurant_name}')]")
    edit= edit.find_element(:xpath,"..");
    edit= edit.find_element(:xpath,"//span[@class=\"glyphicon glyphicon-pencil\"]").click
    sleep(1)
    @session.driver.browser.find_element(:css,"div.buttons_container > button").text
  end
end

def edit_new_restaurant_price_range(new_price_range)
    @session.within(:add_restaurants_form_area) do
    price_r= @session.driver.browser.find_element(:xpath,"//div[contains(text(),'Rank 1')]")
    price_r= price_r.find_element(:xpath,"..");
    price_r= price_r.find_element(:xpath,"..");
    price_r= price_r.find_element(:xpath,"..");
    price_r.click
    @session.driver.browser.find_element(:xpath,"//div[contains(text(),'#{new_price_range}')]").click
    @session.driver.browser.find_element(:css,"div.buttons_container > button").click 
    array= @session.driver.browser.find_element(:xpath,"//div[@class=\"alert alert-success\"]").text.split(/\n/)[1]
    
  end
end

def click_on_add_restaurants_button
    @session.within(:add_restaurants_area) do
    @session.driver.browser.find_element(:xpath,"//div[@class=\"col-md-2\"]/button").click
    sleep(1)
    @session.driver.browser.find_element(:xpath,"//button[@class=\"btn button pull-right\"]").text
  end
end

def fill_in_restaurant_name(rest_name)
   @session.within(:add_restaurants_form_area) do
    restaurant_name= @session.driver.browser.find_element(:class,"form-control.input_fields.ember-view.ember-text-field")
    restaurant_name.send_keys("#{rest_name}");
   end
  end


end

