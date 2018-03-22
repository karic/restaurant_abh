require './spec_helper'

first_name= "Berina"
last_name= "Avdic"
email = "berina.avdicvx@gmail.com"
password = "restoran"
phone= "061546765"
country= "Bosnia and Herzegovina"
city= "Sarajevo"

describe "Registration of a user" do

  let(:register) { @homepage.get_main.get_register }

  context "Click on login in navigation" do
    it "opens login page" do
      login_header = register.click_on_navigation_login
      expect(login_header).to match(/login/i)
    end
  end

context "Click on create account on login page" do
    it "opens create account form" do
      create_account = register.click_on_create_account
      expect(create_account).to match(/create account/i)
    end
  end

  context "Fill in valid email, password and click login" do
    it "login fill and click successfully" do
      register.fill_in_first_name(first_name)
      register.fill_in_last_name(last_name)
      register.fill_in_email(email)
      register.fill_in_phone(phone)
      register.select_country(country)
      register.select_city(city)
      register.fill_in_password(password)
      register.fill_in_confirm_password(password)
      register_check= register.click_on_create_account_button
      expect(register_check).not_to match('Login')
    end
  end
end
