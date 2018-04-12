require './spec_helper'

email = "irfankr91@gmail.com"
password = "blablabla"

describe "Login functionality - invalid data" do

let(:main) { @homepage.get_main }
let(:reserve) { @homepage.get_main.get_reserve }
let(:login) { @homepage.get_main.get_login }

  context "Click on login in navigation" do
    it "opens login page" do
      login_header= login.click_on_navigation_login
      expect(login_header).to match(/login/i) 
      end
    end

  context "No entered data, click login button" do
    it "not logged in successfully" do
      login_check= login.click_on_login_button_invalid_data
      sleep(1)
      
      expect(login_check).to eq('Warning! All fields are required.')
    end
  end

  context "Fill in email and invalid password and click login" do
    it "not logged in successfully" do
      login.fill_in_email(email)
      login.fill_in_password(password)
      login_check= login.click_on_login_button_invalid_data
      sleep(1)
            
      expect(login_check).to eq('Entered data is not valid! You have 1 of 5 attempts!')
    end
  end

  context "Fill in email and invalid password and click login" do
    it "not logged in successfully" do
      login.fill_in_email(email)
      login.fill_in_password(password)
      login_check= login.click_on_login_button_invalid_data
      sleep(1)
      
      expect(login_check).to eq('Entered data is not valid! You have 2 of 5 attempts!')
    end
  end

  context "Fill in valid email and invalid password and click login" do
    it "not logged in successfully" do
      login.fill_in_email(email)
      login.fill_in_password(password)
      login_check= login.click_on_login_button_invalid_data
      sleep(1)
      expect(login_check).to eq('Entered data is not valid! You have 3 of 5 attempts!')
    end
  end

  context "Fill in email and invalid password and click login button" do
    it "not logged in successfully" do
      login.fill_in_email(email)
      login.fill_in_password(password)
      login_check= login.click_on_login_button_invalid_data
      sleep(1)
      expect(login_check).to eq('Entered data is not valid! You have 4 of 5 attempts!')
    end
  end

  context "Fill in email and invalid password and click login button" do
    it "not logged in successfully" do
      login.fill_in_email(email)
      login.fill_in_password(password)
      login_check= login.click_on_login_button_invalid_data
      sleep(1)
      expect(login_check).to eq('Entered data is not valid! You have 5 of 5 attempts!')
    end
  end

context "Fill in email and invalid password and click login button" do
    it "not logged in successfully" do
      login.fill_in_email(email)
      login.fill_in_password(password)
      login_check= login.click_on_login_button_invalid_data
      sleep(1)
      expect(login_check).to eq('Your account is currently locked for 15 minutes!')
    end
  end
end