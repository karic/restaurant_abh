require 'rest-client'
require 'json'
require './setup_browser'

setup = SetupBrowser.new

url = setup.domain.to_s + ":" + setup.port.to_s + setup.apiversion.to_s

describe "API test: register a user with empty data" do

context "Register a new user with empty first name" do
    it "new user not registered sucessfully" do
	body = begin
    RestClient.post(url+'/register', {"email":"noviuser123@gmail.com","firstName":"","lastName":"Korisnik","Phone":"13215156","country":"BiH","city":"Maglaj","password":"10062016"})
    rescue => e
    e.response.body
    end
    parsed = JSON.parse(body)
	expect(parsed['error']).to match(/First name must start with capital letter!/i)
    end
  end

context "Register a new user with empty last name" do
    it "new user not registered sucessfully" do
    body = begin
    RestClient.post(url+'/register', {"email":"noviuser123@gmail.com","firstName":"Novi","lastName":"","Phone":"13215156","country":"BiH","city":"Maglaj","password":"10062016"})
    rescue => e
    e.response.body
    end
    parsed = JSON.parse(body)
    expect(parsed['error']).to match(/Last name is not valid/i)
    end
  end

context "Register a new user with empty email" do
    it "new user not registered sucessfully" do
    body = begin
    RestClient.post(url+'/register', {"email":"","firstName":"Novi","lastName":"Korisnik","Phone":"13215156","country":"BiH","city":"Maglaj","password":"10062016"})
    rescue => e
    e.response.body
    end
    parsed = JSON.parse(body)
    expect(parsed['error']).to eq('User with entered mail exist!')
  end
end

context "Register a new user with empty country" do
    it "new user not registered sucessfully" do
    body = begin
    RestClient.post(url+'/register', {"email":"noviuser@gmail.com","firstName":"Novi","lastName":"Korisnik","Phone":"13215156","country":"","city":"Maglaj","password":"10062016"})
    rescue => e
    e.response.body
    end
    parsed = JSON.parse(body)
    expect(parsed['error']).to eq('Country is not valid!')
  end
end

context "Register a new user with empty city" do
    it "new user not registered sucessfully" do
    body = begin
    RestClient.post(url+'/register', {"email":"noviuser@gmail.com","firstName":"Novi","lastName":"Korisnik","Phone":"13215156","country":"BiH","city":"","password":"10062016"})
    rescue => e
    e.response.body
    end
    parsed = JSON.parse(body)
    expect(parsed['error']).to eq('City is not valid!')
  end
end

context "Register a new user with empty password" do
    it "new user not registered sucessfully" do
    body = begin
    RestClient.post(url+'/register', {"email":"noviuser@gmail.com","firstName":"Novi","lastName":"Korisnik","Phone":"13215156","country":"BiH","city":"Maglaj","password":""})
    rescue => e
    e.response.body
    end
    parsed = JSON.parse(body)
    expect(parsed['error']).to eq('Password is not valid!')
  end
end

context "Register a new user wtih empty phone number" do
    it "new user not registered sucessfully" do
    body = begin
    RestClient.post(url+'/register', {email:'noviuser262@gmail.com',firstName:'Novi',lastName:'Korisnik',Phone:'',country:'BiH',city:'Maglaj',password:'10062016'})
    rescue => e
    e.response.body
    end
    parsed = JSON.parse(body)
    expect(parsed['error']).to eq('Phone number is not valid!')
  end
end
end
