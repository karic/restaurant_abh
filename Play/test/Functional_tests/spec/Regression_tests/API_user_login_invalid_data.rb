require 'rest-client'
require 'json'
require './setup_browser'

setup = SetupBrowser.new

url = setup.domain.to_s + ":" + setup.port.to_s + setup.apiversion.to_s

describe "API negative test: invalid login" do

context "Login with invalid password" do
  it "user does not log in successfully" do
    for i in 1..5
      body = begin
      RestClient.post(url+'/login', {email:setup.email.to_s,password:setup.password.to_s, rememberMe:setup.rememberMe.to_s})
      rescue => e
      e.response.body
  	  end
      parsed = JSON.parse(body)
      expect(parsed["error"]).to eq("Entered data is not valid! You have #{i} of 5 attempts!")
    end
  end
end

context "Login with invalid password" do
    it "user does not log in successfully" do
      body = begin
      RestClient.post(url+'/login', {email:setup.email.to_s,password:setup.password.to_s, rememberMe:setup.rememberMe.to_s})
      rescue => e
      e.response.body
  	  end
      parsed = JSON.parse(body)
      expect(parsed['error']).to eq('Your account is currently locked for 15 minutes!')
      end
    end
end