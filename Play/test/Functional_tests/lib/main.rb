class Main < HomePage

def click_on_navigation_login
    @session.within(:menu_area) do
    @session.find_link('Login').click
    @session.driver.browser.find_element(:css,"div.col-md-6.col-center-block.login_register_container > h1").text
  end
end
  
def click_on_create_account
    @session.within(:create_account_area) do
    @session.find_link('Create account').click
    @session.driver.browser.find_element(:css,"div.col-md-6.col-center-block.login_register_container > h1").text
  end
end

def click_on_navigation_home
    @session.within(:menu_area) do
    @session.find_link('Home').click
    #sleep(30)
    #@session.driver.browser.find_element(:css,"div.background > h1").text
  end
end

def click_on_navigation_restaurants
    @session.within(:menu_area) do
    @session.find_link('Restaurants').click
    wait = Selenium::WebDriver::Wait.new(:timeout => 8)
    input = wait.until {
    element= @session.driver.browser.find_element(:css,"div.reservation_column_button > button")
    element if element.displayed?
}  
input.text
  end
end

def check_reservations_page_open
    @session.within(:find_a_table_area) do
    search_button= @session.driver.browser.find_element(:css,"div.reservation_column_button > button").text
end
end

def click_on_reservations_link
  @session.within(:menu_area) do
  reservation= @session.driver.browser.find_element(:css,"a.dropdown-toggle").click
  #reservation= reservation.find_element(:xpath,"..");
  #reservation= reservation.find_element(:css,"a.ember-view").click
  @session.click_link('Reservations')
  @session.driver.browser.find_element(:css,"div.box_shadow.restaurant_data_container > h1").text
end
end

def click_on_logout
  @session.within(:menu_area) do
    @session.driver.browser.find_element(:css,"a.dropdown-toggle").click
    @session.driver.browser.find_element(:xpath,"//div[@class=\"ember-view\"]/header/div/nav/ul/li[3]/ul/li[1]/a").click
    sleep(2)
    @session.driver.browser.find_element(:xpath,"//ul[@class=\"navbar-right\"]/li[3]/a").text
  end
end

def click_on_navigation_administration
    @session.within(:menu_area) do
    @session.find_link('Administration').click
    sleep(1)
    @session.driver.browser.find_element(:xpath,"//ul[@class=\"navigation\"]/li[1]/a").text
  end
end
 
  def get_login
   Login.new(@session)
  end

  def get_register
    Register.new(@session)
  end

  def get_reserve
    Reserve.new(@session)
  end

def get_review
    Review.new(@session)
  end
  def get_admin
    Admin.new(@session)
  end

end