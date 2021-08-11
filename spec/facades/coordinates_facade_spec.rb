require 'rails_helper'

RSpec.describe 'Coordinates Facade' do
  describe 'coordinates' do
    it 'can return boise location', :vcr do
      location = CoordinatesFacade.find_coordinates('Boise,ID')

      expect(location).to be_a(Location)
      expect(location.lat).to eq(43.615791)
      expect(location.long).to eq(-116.201579)
    end

    it 'can return auckland location' , :vcr do
      location = CoordinatesFacade.find_coordinates('Auckland,NZ')

      expect(location).to be_a(Location)
      expect(location.lat).to eq( -36.853467)
      expect(location.long).to eq(174.765551)
    end
  end

  describe 'routes' do
    it 'can return a route' , :vcr do
      route = CoordinatesFacade.get_route('Boise,ID','Denver,CO')

      expect(route).to be_a(Route)
      expect(route.id).to eq(nil)
      expect(route.start_city).to be_a(String)
      expect(route.end_city).to be_a(String)
      expect(route.travel_time).to be_a(String)
      expect(route.weather_at_eta).to be_a(Hash)
    end
  end
end