require './spec_helper'

first_name= "Berina"
last_name= "Avdic"
email = "berina.avdicvxy@gmail.com"
password = "restoran"
phone= "061546765"
country= "Bosnia and Herzegovina"
city= "Sarajevo"

describe "Registration of a user mandatory fields" do

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

context "Fill all fields except Country" do
    it "New account not created successfully" do
      register.fill_in_first_name(first_name)
      register.fill_in_last_name(last_name)
      register.fill_in_email(email)
      register.fill_in_phone(phone)
      register.fill_in_password(password)
      register.fill_in_confirm_password(password)
      register_check= register.click_on_create_account_button_empty_invalid_data
      expect(register_check).to eq('Warning! All fields are required.')
    end
  end

context "Fill all fields except City" do
    it "New account not created successfully" do
      register.fill_in_first_name(first_name)
      register.fill_in_last_name(last_name)
      register.fill_in_email(email)
      register.fill_in_phone(phone)
      register.select_country(country)
      register.fill_in_password(password)
      register.fill_in_confirm_password(password)
      register_check= register.click_on_create_account_button_empty_invalid_data
      expect(register_check).to eq('Warning! All fields are required.')
    end
  end

  context "Fill all fields except First name" do
    it "New account not created successfully" do
      register.fill_in_first_name("")
      register.fill_in_last_name(last_name)
      register.fill_in_email(email)
      register.fill_in_phone(phone)
      register.select_city(city)
      register.fill_in_password(password)
      register.fill_in_confirm_password(password)
      register_check= register.click_on_create_account_button_empty_invalid_data
      expect(register_check).to eq('First name is not valid!')
    end
  end

context "Fill all fields except Last name" do
    it "New account not created successfully" do
      register.fill_in_first_name(first_name)
      register.fill_in_last_name("")
      register.fill_in_email(email)
      register.fill_in_phone(phone)
      register.fill_in_password(password)
      register.fill_in_confirm_password(password)
      register_check= register.click_on_create_account_button_empty_invalid_data
      expect(register_check).to eq('Last name is not valid!')
    end
  end

  context "Fill all fields except Email" do
    it "New account not created successfully" do
      register.fill_in_first_name(first_name)
      register.fill_in_last_name(last_name)
      register.fill_in_email("")
      register.fill_in_phone(phone)
      register.fill_in_password(password)
      register.fill_in_confirm_password(password)
      register_check= register.click_on_create_account_button_empty_invalid_data
      expect(register_check).to eq('Warning! Email is not valid.')
    end
  end

context "Fill all fields except Phone number" do
    it "New account not created successfully" do
      register.fill_in_first_name(first_name)
      register.fill_in_last_name(last_name)
      register.fill_in_email(email)
      register.fill_in_phone("")
      register.fill_in_password(password)
      register.fill_in_confirm_password(password)
      register_check= register.click_on_create_account_button_empty_invalid_data
      expect(register_check).to eq('Warning! Phone number is not valid.')
    end
  end

context "Fill all fields except Password" do
    it "New account not created successfully" do
      register.fill_in_first_name(first_name)
      register.fill_in_last_name(last_name)
      register.fill_in_email(email)
      register.fill_in_phone(phone)
      register.fill_in_password("")
      register.fill_in_confirm_password(password)
      register_check= register.click_on_create_account_button_empty_invalid_data
      expect(register_check).to eq('Warning! Password and Confirm password don\'t match.')
    end
  end

  context "Fill all fields except Confirm password" do
    it "New account not created successfully" do
      register.fill_in_first_name(first_name)
      register.fill_in_last_name(last_name)
      register.fill_in_email(email)
      register.fill_in_phone(phone)
      register.fill_in_password(password)
      register.fill_in_confirm_password("")
      register_check= register.click_on_create_account_button_empty_invalid_data
      expect(register_check).to eq('Warning! Password and Confirm password don\'t match.')
    end
  end

end
