require 'rest-client'
require 'json'
require './setup_browser'

setup = SetupBrowser.new

url = setup.domain.to_s + ":" + setup.port.to_s + setup.apiversion.to_s

describe "API negative test: invalid login" do

context "Login with invalid password" do
  it "user does not log in sucessfully" do
    for i in 1..5
      body = begin
      RestClient.post(url+'/login', {email:'irfankr91@gmail.com',password:'123',rememberMe:'false'})
      rescue => e
      e.response.body
  	  end
      parsed = JSON.parse(body)
      expect(parsed["error"]).to eq("Entered data is not valid! You have #{i} of 5 attempts!")
    end
  end
end
end
# context "Login with invalid password" do
#     it "user does not log in sucessfully" do
#       body = begin
#       RestClient.post(url+'/login', {email:'irfankr91@gmail.com',password:'123',rememberMe:'false'})
#       rescue => e
#       e.response.body
#   	  end
#       parsed = JSON.parse(body)
#       expect(parsed['error']).to eq('Entered data is not valid! You have 2 of 5 attempts!')
#       end
#     end

#  context "Login with invalid password" do
#     it "user does not log in sucessfully" do
#       body = begin
#       RestClient.post(url+'/login', {email:'irfankr91@gmail.com',password:'123',rememberMe:'false'})
#       rescue => e
#       e.response.body
#   	  end
#       parsed = JSON.parse(body)
#       expect(parsed['error']).to eq('Entered data is not valid! You have 3 of 5 attempts!')
#       end
#     end

#  context "Login with invalid password" do
#     it "user does not log in sucessfully" do
#       body = begin
#       RestClient.post(url+'/login', {email:'irfankr91@gmail.com',password:'123',rememberMe:'false'})
#       rescue => e
#       e.response.body
#   	  end
#       parsed = JSON.parse(body)
#       expect(parsed['error']).to eq('Entered data is not valid! You have 4 of 5 attempts!')
#       end
#     end

# context "Login with invalid password" do
#     it "user does not log in sucessfully" do
#       body = begin
#       RestClient.post(url+'/login', {email:'irfankr91@gmail.com',password:'123',rememberMe:'false'})
#       rescue => e
#       e.response.body
#   	  end
#       parsed = JSON.parse(body)
#       expect(parsed['error']).to eq('Entered data is not valid! You have 5 of 5 attempts!')
#       end
#     end

# context "Login with invalid password" do
#     it "user does not log in sucessfully" do
#       body = begin
#       RestClient.post(url+'/login', {email:'irfankr91@gmail.com',password:'123',rememberMe:'false'})
#       rescue => e
#       e.response.body
#   	  end
#       parsed = JSON.parse(body)
#       expect(parsed['error']).to eq('Your account is currently locked for 15 minutes!')
#       end
#     end
# end