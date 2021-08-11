require 'rails_helper'

RSpec.describe 'create' do
  before :each do
    @user = User.create(email: "test@testing.com", password: "testing123", password_confirmation: "testing123", api_key: "lOPbJUvhG02ABSCd12UYHlFGmFWATzbm")
  end

  describe 'happy path' do
    it 'can create a session when a user logs in', :vcr do
      headers = {'Content-Type' => "application/json", 'Accept' => "application/json"}
      body = {"email": "test@testing.com",
              "password": "testing123"}

      post '/api/v1/sessions', headers: headers, params: body.to_json
      session = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(session[:data]).to have_key(:id)
      expect(session[:data]).to have_key(:type)
      expect(session[:data]).to have_key(:attributes)

      expect(session[:data][:attributes]).to have_key(:email)
      expect(session[:data][:attributes]).to have_key(:api_key)

      expect(session[:data]).to_not have_key(:password)
      expect(session[:data]).to_not have_key(:password_confirmation)
    end
  end

  describe 'sad paths' do
    it "can return an error for nonexistant email" , :vcr do
      headers = {'Content-Type' => "application/json", 'Accept' => "application/json"}
      body = {"email": "testing@testing.com",
              "password": "testing123"}

      post '/api/v1/sessions', headers: headers, params: body.to_json

      expect(response.body).to eq("{\"errors\":\"Incorrect password or email.\"}")
      expect(response.status).to eq(400)
    end

    it "can return an error for an incorrect password" , :vcr do
      headers = {'Content-Type' => "application/json", 'Accept' => "application/json"}
      body = {"email": "test@testing.com",
              "password": "testing321"}

      post '/api/v1/sessions', headers: headers, params: body.to_json

      expect(response.body).to eq("{\"errors\":\"Incorrect password or email.\"}")
      expect(response.status).to eq(400)
    end

    it 'can return an error for empty email field' , :vcr do
      headers = {'Content-Type' => "application/json", 'Accept' => "application/json"}
      body = {"email": "",
              "password": "testing321"}
      post '/api/v1/sessions', headers: headers, params: body.to_json

      expect(response.body).to eq("{\"errors\":\"Please enter both a password and email.\"}")
      expect(response.status).to eq(401)
    end

    it 'can return an error for empty password field' , :vcr do
      headers = {'Content-Type' => "application/json", 'Accept' => "application/json"}
      body = {"email": "test@testing.com",
              "password": ""}

      post '/api/v1/sessions', headers: headers, params: body.to_json

      expect(response.body).to eq("{\"errors\":\"Please enter both a password and email.\"}")
      expect(response.status).to eq(401)
    end
  end
end