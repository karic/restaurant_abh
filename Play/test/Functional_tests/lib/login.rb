class Login < Main

   def fill_in_email(email)
    @session.within(:login_area) do
      @session.fill_in('Email', with: email)
    end
  end

  def fill_in_password(password)
    @session.within(:login_area) do
      @session.fill_in('Password', with: password)
    end
  end

  def click_on_login_button
    @session.within(:login_area) do
      @session.click_button('Login')
      wait = Selenium::WebDriver::Wait.new(:timeout => 4)
    input = wait.until {
      element= @session.driver.browser.find_element(:css,"a.dropdown-toggle")
      element if element.displayed?
    }  
    input.text 
    sleep(2)
    end
  end

def click_on_login_button_invalid_data
    @session.within(:login_area) do
      @session.click_button('Login')
      element= @session.driver.browser.find_element(:css,"div.alertText")  
      element.text 
    end
  end

end