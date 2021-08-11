require 'rails_helper'

RSpec.describe BreweriesFacade do
  it 'can get breweries infomation', :vcr do
    city_state_names = 'Boise,ID'
    location = CoordinatesFacade.find_coordinates(city_state_names)
    response = BreweriesFacade.find_city_current_weather_and_breweries(city_state_names, [location.lat, location.long], 5)

    expect(response).to be_a(Brewery)
    expect(response.destination).to be_a(String)
    expect(response.breweries.count).to eq(5)
    expect(response.breweries).to be_a(Array)
    expect(response.forecast).to be_a(Hash)
  end
end