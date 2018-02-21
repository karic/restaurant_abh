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
    edit= @session.driver.browser.find_element(:xpath,"//td[contains(text(),'#{restaurant_name}')]/following-sibling::td/span[@class=\"glyphicon glyphicon-pencil\"]")
    edit.click
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

def click_on_menu_button
  @session.within(:edit_restaurants_navigation_area) do
  @session.find_link('Menu').click
  @session.driver.browser.find_element(:xpath,"//button[@class=\"menu_title_Breakfast menu_button active\"]").text 
  end
end

def fill_in_dish_name(dish)
  @session.within(:restaurant_tab_area) do
  dish_name=@session.driver.browser.find_element(:xpath,"//input[@placeholder=\"Name\"]")
  dish_name.send_keys("#{dish}")
  end
end

def fill_in_dish_description(description)
  @session.within(:restaurant_tab_area) do
  dish_desc=@session.driver.browser.find_element(:xpath,"//input[@placeholder=\"Description\"]")
  dish_desc.send_keys("#{description}")
  end
end

def fill_in_dish_price(price)
  @session.within(:restaurant_tab_area) do
    dish_price=@session.driver.browser.find_element(:xpath,"//input[@placeholder=\"$\"]")
    dish_price.send_keys("#{price}")
  end
end

def click_on_add_dish_button
  @session.within(:restaurant_tab_area) do
    dish_button=@session.driver.browser.find_element(:xpath,"//button[@class=\"admin_menu_buttons_add\"]")
    dish_button.click
  end
end

def click_on_save_dish_button
  @session.within(:restaurant_tab_area) do
    @session.click_button('Save')
  end
end

def click_on_edit_dish_icon
  @session.within(:restaurant_tab_area) do
  end
end 

def click_on_bin_dish_icon
  @session.within(:restaurant_tab_area) do
    bin_button=@session.driver.browser.find_element(:xpath,"//span[@class=\"glyphicon glyphicon-trash\"]")
    bin_button.click
  end
end
def edit_existing_menu_item(menu_name, new_menu_name)
    @session.within(:restaurant_tab_area) do
    dish_name= @session.driver.browser.find_element(:xpath,"//div[@class='box_shadow administration_fields']//div[text()='#{menu_name}']")
    dish_name= dish_name.find_element(:xpath,"..");
    dish_name= dish_name.find_element(:xpath,"..");    
    dish_name= dish_name.find_element(:xpath,"//span[@class=\"glyphicon glyphicon-pencil\"]").click
    @session.driver.browser.find_element(:xpath,"//div[@class='row administration_menu_table_div_row']//div[@class='col-md-3']").click
    @session.driver.browser.find_element(:xpath,"//div[@class='col-md-3']//input[@class='form-control input_fields ember-view ember-text-field']").clear
    @session.driver.browser.find_element(:xpath,"//div[@class='col-md-3']//input[@class='form-control input_fields ember-view ember-text-field']").send_keys("#{new_menu_name}")
    @session.driver.browser.find_element(:xpath,"//button[@class=\"admin_menu_buttons_add\"]").click
    edited= @session.driver.browser.find_element(:xpath,"//div[@class='box_shadow administration_fields']//div[text()='#{new_menu_name}']") ? "Sucessfully edited": "Not sucessfully edited"
    end
end
def click_on_tables_tab
    @session.within(:edit_restaurants_navigation_area) do
    @session.find_link('Tables').click
    sleep(1)
    @session.driver.browser.find_element(:css,"div.col-md-1 > button").text
  end
end


def add_new_table(sitting_places)
    @session.within(:restaurant_tab_area) do
    @session.fill_in('Sitting places', with: sitting_places)
    @session.driver.browser.find_element(:css,"div.col-md-1 > button").click
    @session.click_button('Save')
    @session.driver.browser.find_element(:xpath,"//a[@class=\"close\"]").click
  end
end

def find_all_table_elements
 @session.within(:restaurant_tab_area) do
  all=@session.all(:xpath,"//div[@class=\"row administration_menu_table_div_row\"]")
  Array(all)
 end
end 

def edit_existing_table(sitting_places, new_sitting_places)
    @session.within(:restaurant_tab_area) do
    sit_places= @session.driver.browser.find_element(:xpath,"//div[@class='box_shadow administration_fields']//strong[text()='#{sitting_places}']")
    sit_places= sit_places.find_element(:xpath,"..");
    sit_places= sit_places.find_element(:xpath,"..");    
    sit_places= sit_places.find_element(:xpath,"//span[@class=\"glyphicon glyphicon-pencil\"]").click
    @session.driver.browser.find_element(:xpath,"//div[@class='row administration_menu_table_div_row']//div[@class='col-md-4']").click
    @session.driver.browser.find_element(:xpath,"//div[@class='col-md-4']//input[@class='form-control input_fields ember-view ember-text-field']").clear    
    @session.driver.browser.find_element(:xpath,"//div[@class='col-md-4']//input[@class='form-control input_fields ember-view ember-text-field']").send_keys("#{new_sitting_places}")
    @session.driver.browser.find_element(:xpath,"//button[@class=\"admin_menu_buttons_add\"]").click
    edited= @session.driver.browser.find_element(:xpath,"//div[@class='box_shadow administration_fields']//strong[text()='#{new_sitting_places}']") ? "Sucessfully edited": "Not sucessfully edited"
    end
end

def delete_existing_table(new_sitting_places)
    @session.within(:restaurant_tab_area) do
    sit_places= @session.driver.browser.find_element(:xpath,"//div[@class='box_shadow administration_fields']//strong[text()='#{new_sitting_places}']")
    sit_places= sit_places.find_element(:xpath,"..");
    sit_places= sit_places.find_element(:xpath,"..");    
    sit_places= sit_places.find_element(:xpath,"//span[@class=\"glyphicon glyphicon-trash\"]").click
    @session.click_button('Save')
  end
end

def click_on_reservations_tab
    @session.within(:edit_restaurants_navigation_area) do
    @session.find_link('Reservations').click
    @session.driver.browser.find_element(:xpath,"//td[@class='col-md-3']//strong[contains(text(),'Id table')]").text
  end
end

=begin
def click_on_delete_reservation_icon(restaurant_name)
    @session.within(:restaurants_table_area) do
    delete= @session.driver.browser.find_element(:xpath,"//td[contains(text(),'#{restaurant_name}')]")
    #delete= delete.find_element(:xpath,"..");
    delete= delete.find_element(:xpath,"//span[@class=\"glyphicon glyphicon-trash\"]").click
    array= @session.driver.browser.find_element(:xpath,"//div[@class=\"alert alert-success\"]").text.split(/\n/)[1]
  end
end
=end
def click_on_add_restaurants_button
    @session.within(:add_restaurants_area) do
    @session.driver.browser.find_element(:xpath,"//div[@class=\"col-md-2\"]/button").click
    sleep(1)
    @session.driver.browser.find_element(:xpath,"//button[@class=\"btn button pull-right\"]").text
  end
end

=begin
def upload_logo_image
  @session.within(:add_restaurants_form_area) do
    upload_logo= @session.driver.browser.find_element(:xpath,"//div[@class='box_shadow administration_fields column_same_height']//span[text()='Upload logo']")
    upload_logo= upload_logo.find_element(:xpath,"..");
    upload_logo= upload_logo.find_element(:xpath,"..");
    upload_logo.click
    Clipboard.copy('/home/berina/Desktop/logo.jpeg')
    
    driver.action.key_down(:control)
            .send_keys("v")
            .key_up(:control)
            .perform
    require 'byebug' ; byebug
   end
  end
=end

def fill_in_restaurant_name(rest_name)
   @session.within(:add_restaurants_form_area) do
    restaurant_name= @session.driver.browser.find_element(:xpath,"//div[@class='box_shadow administration_fields column_same_height']//input[@class=\"form-control input_fields ember-view ember-text-field\"]")
    restaurant_name.send_keys("#{rest_name}");
   end
  end

def fill_in_description(description)
   @session.within(:add_restaurants_form_area) do
    descript= @session.driver.browser.find_element(:xpath,"//textarea[@class=\"ember-view ember-text-area\"]")
    descript.send_keys("#{description}");
   end
  end

def select_price_range(price_range)
   @session.within(:add_restaurants_form_area) do
    price_r= @session.driver.browser.find_element(:xpath,"//input[@placeholder=\"Select price range\"]")
    price_r= price_r.find_element(:xpath,"..");
    price_r= price_r.find_element(:xpath,"..");
    price_r.click
    @session.driver.browser.find_element(:xpath,"//div[text()='#{price_range}']").click
   end
  end

def select_location(location)
   @session.within(:add_restaurants_form_area) do
    locate= @session.driver.browser.find_element(:xpath,"//input[@placeholder=\"Select location\"]")
    locate= locate.find_element(:xpath,"..");
    locate= locate.find_element(:xpath,"..");
    locate.click
    @session.driver.browser.find_element(:xpath,"//div[text()='#{location}']").click
   end
  end

def select_category(category)
   @session.within(:add_restaurants_form_area) do
    categ= @session.driver.browser.find_element(:xpath,"//input[@placeholder=\"Select categories\"]")
    categ= categ.find_element(:xpath,"..");
    categ= categ.find_element(:xpath,"..");
    categ.click
    @session.driver.browser.find_element(:xpath,"//div[text()='#{category}']").click
   end
  end

def click_on_add_restaurant_button
    @session.within(:add_restaurants_area) do
    @session.driver.browser.find_element(:xpath,"//button[@class=\"btn button pull-right\"]").click
    array= @session.driver.browser.find_element(:xpath,"//div[@class=\"alert alert-success\"]").text.split(/\n/)[1]
  end
end

def click_on_save_info_button
    @session.within(:add_restaurants_area) do
    @session.driver.browser.find_element(:xpath,"//button[@class=\"btn button pull-right\"]").click
    array= @session.driver.browser.find_element(:xpath,"//div[@class=\"alert alert-success\"]").text.split(/\n/)[1]
  end
end

def click_on_administration_users
    @session.within(:admin_navigation_area) do
    @session.find_link('Users').click
    @session.driver.browser.find_element(:xpath,"//div[@class=\"col-md-2\"]/button").text
  end
end

def click_on_delete_existing_user(user_email)
    @session.within(:restaurants_table_area) do
    del= @session.driver.browser.find_element(:xpath,"//td[contains(text(),'#{user_email}')]/following-sibling::td/span[@class=\"glyphicon glyphicon-trash\"]")
    del.click
    array= @session.driver.browser.find_element(:xpath,"//div[@class=\"alert alert-success\"]").text.split(/\n/)[1]
  end
end


def click_on_delete_restaurant_icon(restaurant_name)
    @session.within(:restaurants_table_area) do
    delete= @session.driver.browser.find_element(:xpath,"//td[contains(text(),'#{restaurant_name}')]/following-sibling::td/span[@class=\"glyphicon glyphicon-trash\"]")
    delete.click
    array= @session.driver.browser.find_element(:xpath,"//div[@class=\"alert alert-success\"]").text.split(/\n/)[1]

  end
end
end
