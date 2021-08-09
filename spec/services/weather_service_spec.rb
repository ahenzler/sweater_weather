require 'rails_helper'

RSpec.describe 'Weather Service' do
  describe 'weather service' do
    it 'can get boise coords', :vcr do
      location = CoordinatesFacade.find_coordinates("Boise,ID")
      response = WeatherService.get_weather(location.lat, location.long)

      expect(response).to be_a(Hash)
      expect(response[:current]).to be_a(Hash)
      expect(response[:hourly]).to be_a(Array)
      expect(response[:daily]).to be_a(Array)
      expect(response).to_not have_key(:minutely)
      expect(response).to_not have_key(:alerts)
    end
  end
end