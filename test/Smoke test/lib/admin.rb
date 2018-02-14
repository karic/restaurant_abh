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
require 'byebug' ; byebug
    @session.driver.browser.find_element(:td,"#{restaurant_name}")
    @session.driver.browser.find_element(:xpath,"..");
    @session.driver.browser.find_element(:class,"glyphicon.glyphicon-pencil").click

  end
end


def click_on_add_restaurants_button
    @session.within(:add_restaurants_area) do
    @session.driver.browser.find_element(:xpath,"//div[@class=\"col-md-2\"]/button").click
    sleep(1)
    @session.driver.browser.find_element(:xpath,"//button[@class=\"btn button pull-right\"]").text
  end
end

def fill_in_restaurant_name(restaurant_name)
   @session.within(:add_restaurants_form_area) do
    restaurant_name= @session.driver.browser.find_element(:class,"form-control.input_fields.ember-view.ember-text-field")
    restaurant_name.send_keys("#{restaurant_name}");
   end
  end


end

