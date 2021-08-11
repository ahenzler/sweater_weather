require 'rails_helper'

RSpec.describe 'MapquestService' do
  describe 'get location' do
    it 'can get boise latitude and longitude', :vcr do
      response = MapquestService.get_address_location('Boise,ID')

      expect(response).to be_a(Hash)
      expect(response[:results][0][:locations][0][:latLng]).to be_a(Hash)
      expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
      expect(response[:results][0][:locations][0][:latLng][:lat]).to eq(43.615791)
      expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
      expect(response[:results][0][:locations][0][:latLng][:lng]).to eq(-116.201579)
    end

    it 'can get auckland latitude and longitude', :vcr do
      response = MapquestService.get_address_location('Auckland,NZ')

      expect(response).to be_a(Hash)
      expect(response[:results][0][:locations][0][:latLng]).to be_a(Hash)
      expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
      expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
    end

    it 'can get new york latitude and longitude', :vcr do
      response = MapquestService.get_address_location('New York City,NY')

      expect(response).to be_a(Hash)
      expect(response[:results][0][:locations][0][:latLng]).to be_a(Hash)
      expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
      expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
    end

    it 'can get pitt latitude and longitude', :vcr do
      response = MapquestService.get_address_location('Pittsbugh,PA')
      expect(response).to be_a(Hash)

      expect(response[:results][0][:locations][0][:latLng]).to be_a(Hash)
      expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
      expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
    end
  end

  describe 'get route' do
    it 'can get a response for the route and estimated travel time' do
      response = MapService.get_route("Charlotte, NC", "Galveston, TX")

      expect(response).to be_a(Hash)
      expect(response[:route]).to be_a(Hash)
    end
  end
end