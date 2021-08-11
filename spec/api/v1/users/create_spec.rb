require 'rails_helper'

RSpec.describe 'create' do
  describe 'happy paths' do
    it 'can create a user' , :vcr do
      headers = {'Content-Type' => "application/json", 'Accept' => "application/json"}
      body = {"email": "test@testing.com",
              "password": "testing123",
              "password_confirmation": "testing123"}

      post '/api/v1/users', headers: headers, params: body.to_json
      user = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      expect(user[:data]).to have_key(:id)
      expect(user[:data]).to have_key(:type)
      expect(user[:data]).to have_key(:attributes)

      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes]).to have_key(:api_key)

      expect(user[:data]).to_not have_key(:password)
      expect(user[:data]).to_not have_key(:password_confirmation)
    end
  end

  describe 'sad path' do
    it "it returns an error if password is not matching" , :vcr do
      headers = {'Content-Type' => "application/json", 'Accept' => "application/json"}
      body = {"email": "test@testing.com",
              "password": "testing123",
              "password_confirmation": "testing111" }

      post '/api/v1/users', headers: headers, params: body.to_json
      user = JSON.parse(response.body, symbolize_names: true)

      expect(response.body).to eq("{\"errors\":\"Passwords do not match.\"}")
      expect(response.status).to eq(400)
    end

    it 'returns an error if duplicated email is used' , :vcr do
      headers = {'Content-Type' => "application/json", 'Accept' => "application/json"}
      body = {"email": "test@testing.com",
              "password": "testing123",
              "password_confirmation": "testing123"}

      post '/api/v1/users', headers: headers, params: body.to_json
      user1 = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      headers = {'Content-Type' => "application/json", 'Accept' => "application/json"}
      body = {"email": "test@testing.com",
              "password": "testing321",
              "password_confirmation": "testing321"}

      post '/api/v1/users', headers: headers, params: body.to_json
      user2 = JSON.parse(response.body, symbolize_names: true)

      expect(response.body).to eq("{\"errors\":\"That email is already in use.\"}")
      expect(response.status).to eq(409)
    end

    it 'returns an error if email is not entered' , :vcr do
      headers = {'Content-Type' => "application/json", 'Accept' => "application/json"}
      body = {"email": "",
              "password": "testing321",
              "password_confirmation": "testing321"}


      post '/api/v1/users', headers: headers, params: body.to_json
      user2 = JSON.parse(response.body, symbolize_names: true)

      expect(response.body).to eq("{\"errors\":\"Unable to create user.\"}")
      expect(response.status).to eq(400)
    end

    it 'returns an error if both no password is entered' , :vcr do
      headers = {'Content-Type' => "application/json", 'Accept' => "application/json"}
      body = {"email": "switched_on_bach@wendycarlos.com",
          "password": "",
          "password_confirmation": ""}

      post '/api/v1/users', headers: headers, params: body.to_json
      user2 = JSON.parse(response.body, symbolize_names: true)

      expect(response.body).to eq("{\"errors\":\"Unable to create user.\"}")
      expect(response.status).to eq(400)
    end

    it 'returns an error if password is entered but not confirmed' , :vcr do
      headers = {'Content-Type' => "application/json", 'Accept' => "application/json"}
        body = {"email": "testing@testing.com",
                "password": "testing",
                "password_confirmation": ""}

      post '/api/v1/users', headers: headers, params: body.to_json
      user2 = JSON.parse(response.body, symbolize_names: true)

      expect(response.body).to eq("{\"errors\":\"Passwords do not match.\"}")
      expect(response.status).to eq(400)
    end

    it 'returns an error if password is confirmed but not entered' , :vcr do
      headers = {'Content-Type' => "application/json", 'Accept' => "application/json"}
      body = {"email": "testing@testing.com",
              "password": "",
              "password_confirmation": "testing"}

      post '/api/v1/users', headers: headers, params: body.to_json
      user2 = JSON.parse(response.body, symbolize_names: true)

      expect(response.body).to eq("{\"errors\":\"Passwords do not match.\"}")
      expect(response.status).to eq(400)
    end
  end
end
