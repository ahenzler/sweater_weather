# require 'rails_helper'

# RSpec.describe 'create' do
#   describe 'happy paths' do
#     it 'can create a roadtrip' , :vcr do
#       @user = User.create(email: "testing@testing.com", password: "testing123", password_confirmation: "testing123", api_key: "lOPbJUvhG02ABSCd12UYHlFGmFWATzbmkdsfjhakshd")

#       headers = {
#           'Content-Type': 'application/json',
#           'Accept': 'application/json'
#       }

#       body = {
#           "origin": "Denver,CO",
#           "destination": "London,UK",
#           "api_key": "lOPbJUvhG02ABSCd12UYHlFGmFWATzbmkdsfjhakshd"
#       }

#       post '/api/v1/roadtrip', headers: headers, params: body.to_json

#       road_trip = JSON.parse(response.body, symbolize_names: true)


#       expect(response).to be_successful
#       expect(response.status).to eq(200)

#       expect(road_trip).to have_key(:data)
#       expect(road_trip[:data]).to have_key(:id)
#       expect(road_trip[:data]).to have_key(:type)
#       expect(road_trip[:data]).to have_key(:attributes)

#       expect(road_trip[:data][:attributes]).to have_key(:start_city)
#       expect(road_trip[:data][:attributes]).to have_key(:end_city)
#       expect(road_trip[:data][:attributes]).to have_key(:travel_time)
#       expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)

#       expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
#       expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
#     end
#   end

#   describe 'sad paths' do
#     it 'can create return an error for invalid api key' , :vcr do
#       @user = User.create(email: "testing#", password: "testing123", password_confirmation: "testing123", api_key: "lOPbJUvhG02ABSCd12UYHlFGmFWATzbmkdsfjhakshd")

#       headers = {
#           'Content-Type': 'application/json',
#           'Accept': 'application/json'
#       }

#       body = {
#           "origin": "Denver,CO",
#           "destination": "Westminster,CO",
#           "api_key": "irrelevent"
#       }

#       post '/api/v1/roadtrip', headers: headers, params: body.to_json

#       road_trip = JSON.parse(response.body, symbolize_names: true)


#       expect(response.body).to eq("{\"errors\":\"Invalid API key.\"}")
#       expect(response.status).to eq(401)
#     end
#   end
# end