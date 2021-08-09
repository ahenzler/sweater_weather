require 'rails_helper'

RSpec.describe '' do
  describe 'happy path' do
    it 'can get a city\'s current weather', :vcr do
      get '/api/v1/forecast_weather', params: {location: "boise,id,"}
      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(forecast).to be_a(Hash)
      expect(forecast[:data][:attributes].count).to eq(3)
      expect(forecast[:data][:attributes]).to have_key(:current_weather)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:datetime)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunrise)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunset)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:temp)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:feels_like)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:humidity)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:uvi)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:visibility)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:conditions)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:icon)
    end

    it 'can get a city\'s hourly weather', :vcr do
      get '/api/v1/forecast_weather', params: {location: "boise,id"}
      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(forecast).to be_a(Hash)
      expect(forecast[:data][:attributes]).to have_key(:hourly_weather)
      expect(forecast[:data][:attributes][:hourly_weather].first).to have_key(:time)
      expect(forecast[:data][:attributes][:hourly_weather].first).to have_key(:temp)
      expect(forecast[:data][:attributes][:hourly_weather].first).to have_key(:conditions)
      expect(forecast[:data][:attributes][:hourly_weather].first).to have_key(:icon)
    end

    it 'can get a city\'s daily weather', :vcr do
      get '/api/v1/forecast_weather', params: {location: "boise,id"}
      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(forecast).to be_a(Hash)
      expect(forecast[:data][:attributes]).to have_key(:daily_weather)
      expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:icon)
      expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:date)
      expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:sunrise)
      expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:sunset)
      expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:max_temp)
      expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:min_temp)
      expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:conditions)
    end
  end

  describe 'sad path' do
    it 'will return error if params are incomplete', :vcr do
      get '/api/v1/forecast_weather'

      expect(response.body).to eq("{\"error\":\"Please provide a location\"}")
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end
  end
end
