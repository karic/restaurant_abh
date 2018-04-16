require 'rest-client'
require 'json'
require 'uri'

domain="http://localhost"
port="9000"
apiversion="/api/v1"
url=domain+":"+port+apiversion

describe "API negative test: register a user with invalid data" do

context "Register a new user with invalid first name" do
    it "new user not registered sucessfully" do
    body = begin
    RestClient.post(url+'/register',{"email":"noviuser23@gmail.com","firstName":"novi","lastName":"Korisnik","Phone":"13215156","country":"BiH","city":"Maglaj","password":"10062016"} )
    rescue => e
    e.response.body
    end
    parsed = JSON.parse(body)
	expect(parsed['error']).to match(/First name must start with capital letter!/i)
    end
  end

context "Register a new user with existing email" do
    it "new user not registered sucessfully" do
    body = begin
    RestClient.post(url+'/register', {"email":"irfankr91@gmail.com","firstName":"Novi","lastName":"Korisnik","Phone":"13215156","country":"BiH","city":"Maglaj","password":"10062016"})
    rescue => e
    e.response.body
    end
    parsed = JSON.parse(body)
    expect(parsed['error']).to eq('User with entered mail exist!')
  end
end

context "Register a new user wrong number format" do
    it "new user not registered sucessfully" do
    body = begin
    RestClient.post(url+'/register', {email:'noviuser262@gmail.com',firstName:'Novi',lastName:'Korisnik',Phone:'+387613215156',country:'BiH',city:'Maglaj',password:'10062016'})
    rescue => e
    e.response.body
    end
    parsed = JSON.parse(body)
    expect(parsed['error']).to eq('Phone number is not valid!')
  end
end
end
