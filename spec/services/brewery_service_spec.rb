require 'rails_helper'

RSpec.describe 'BreweryService' do
  describe 'get location' do
    it 'can get boise breweries', :vcr do
      location = CoordinatesFacade.find_coordinates('Boise,ID')
      response = BreweryService.get_breweries([location.lat, location.long], 5)


      expect(response).to be_an(Array)
      expect(response.length).to eq(5)
      expect(response.first).to be_a(Hash)
      expect(response.first).to have_key(:name)
      expect(response.first[:name]).to eq("10 Barrel Brewing Co - Boise")
      expect(response.first).to have_key(:city)
      expect(response.first[:city]).to eq('Boise')
      expect(response.first).to have_key(:state)
      expect(response.first[:state]).to eq('Idaho')
    end
  end
end