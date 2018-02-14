class Register < Main

  def fill_in_first_name(first_name)
    @session.within(:register_area) do
      @session.fill_in('First Name', with: first_name)
    end
  end

def fill_in_last_name (last_name)
    @session.within(:register_area) do
      @session.fill_in('Last Name', with: last_name)
    end
  end

def fill_in_phone (phone)
    @session.within(:register_area) do
      @session.fill_in('Phone Number', with: phone)
    end
  end

  def fill_in_email(email)
    @session.within(:register_area) do
      @session.fill_in('Email', with: email)
    end
  end

  def select_country(sountry)
    @session.within(:register_area) do
    country= @session.driver.browser.find_element(:xpath,"//input[contains(@placeholder,'Select country')]")
    country= country.find_element(:xpath,"..");
    country= country.find_element(:xpath,"..");
    country.click
    #radi sa unosom 'Bosnia and Herzegovina', ali ne i sa varijablom country?!?
    country= country.find_element(:xpath,"//div[contains(@data-value,'#{sountry}')]").click
    end
  end

  def select_city(sity)
    @session.within(:register_area) do
    city= @session.driver.browser.find_element(:xpath,"//input[contains(@placeholder,'Select city')]")
    city= city.find_element(:xpath,"..");
    city= city.find_element(:xpath,"..");
    city.click
    #radi sa unosom 'Sarajevo', ali ne i sa varijablom city?!?
    city= city.find_element(:xpath,"//div[contains(@data-value,'#{sity}')]").click
    end
  end

  def fill_in_password(password)
    @session.within(:register_area) do
      @session.fill_in('Password', with: password)
    end
  end

def fill_in_confirm_password(password)
    @session.within(:register_area) do
      @session.fill_in('Confirm Password', with: password)
    end
  end

  def click_on_create_account_button
    @session.within(:register_area) do
      @session.click_button('Create Account')
      sleep(1)
      @session.driver.browser.find_element(:css,"a.dropdown-toggle").text    
    end
  end
end