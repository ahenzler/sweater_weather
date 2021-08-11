require 'rails_helper'

RSpec.describe 'breweries' do
  describe 'happy path' do
    it 'can get a city\'s weather, breweries', :vcr do
      get '/api/v1/breweries', params: {location: 'boise,id', quantity: 5}

      expect(response).to be_successful

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data).to be_a(Hash)
      expect(data).to have_key(:data)
      expect(data[:data]).to have_key(:attributes)

      expect(data[:data][:attributes]).to have_key(:destination)
      expect(data[:data][:attributes][:destination]).to eq('boise,id')

      expect(data[:data][:attributes]).to have_key(:forecast)
      expect(data[:data][:attributes][:forecast]).to be_a(Hash)
      expect(data[:data][:attributes][:forecast]).to have_key(:summary)
      expect(data[:data][:attributes][:forecast]).to have_key(:temperture)

      expect(data[:data][:attributes]).to have_key(:breweries)
      expect(data[:data][:attributes][:breweries]).to be_a(Array)
      expect(data[:data][:attributes][:breweries].size).to eq(5)

      expect(data[:data][:attributes][:breweries].first).to be_a(Hash)
      expect(data[:data][:attributes][:breweries].first).to have_key(:id)
      expect(data[:data][:attributes][:breweries].first).to have_key(:name)
      expect(data[:data][:attributes][:breweries].first).to have_key(:brewery_type)
    end
  end

  describe 'sad path' do
    it 'will return error if params are incomplete', :vcr do
      get '/api/v1/breweries'

      expect(response.body).to eq("{\"error\":\"Please provide a location and quantity\"}")
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end
  end
end