require './spec_helper'

first_name_lower= "berina"
first_name="Berina"
last_name= "Avdic"
email_existing = "berina.avdicvx@gmail.com"
email_new = "berina.avdicvxy@gmail.com"
password = "restoran"
phone_valid= "061546765"
phone_invalid="+38761546765"
country= "Bosnia and Herzegovina"
city= "Sarajevo"

describe "Registration of user - invalid data" do

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

context "Fill all fields with invalid First Name" do
    it "New account not created successfully" do
      register.fill_in_first_name(first_name_lower)
      register.fill_in_last_name(last_name)
      register.fill_in_email(email_new)
      register.fill_in_phone(phone_valid)
      register.select_country(country)
      register.select_city(city)
      register.fill_in_password(password)
      register.fill_in_confirm_password(password)
      register_check= register.click_on_create_account_button_empty_invalid_data
      expect(register_check).to eq('First name must start with capital letter!')
    end
  end

  context "Fill all fields with exsiting email" do
    it "New account not created successfully" do
      register.fill_in_first_name(first_name)
      register.fill_in_last_name(last_name)
      register.fill_in_email(email_existing)
      register.fill_in_phone(phone_valid)
      register.fill_in_password(password)
      register.fill_in_confirm_password(password)
      register_check= register.click_on_create_account_button_empty_invalid_data
      expect(register_check).to eq('User with entered mail exist!')
    end
  end

context "Fill all fields with invalid " do
    it "New account not created successfully" do
      register.fill_in_first_name(first_name)
      register.fill_in_last_name(last_name)
      register.fill_in_email(email_new)
      register.fill_in_phone(phone_invalid)
      register.fill_in_password(password)
      register.fill_in_confirm_password(password)
      register_check= register.click_on_create_account_button_empty_invalid_data
      expect(register_check).to eq('Warning! Phone number is not valid.')
    end
  end
end
