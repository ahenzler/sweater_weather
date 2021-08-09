require 'rails_helper'

RSpec.describe 'Brewery' do
  it 'can return destination, with breweries and weather' , :vcr do
    city_state_names = 'Boise,ID'
    location = CoordinatesFacade.find_coordinates(city_state_names)
    forecast = (WeatherFacade.find_weather_forecast(location.lat, location.long).current_weather)
    breweries = BreweryService.get_breweries([location.lat, location.long], 5)

    boise = Brewery.new(city_state_names, forecast, breweries)

    expect(boise.id).to be(nil)
    expect(boise.destination).to eq('boise,id')
    expect(boise.breweries).to be_a(Array)
    expect(boise.breweries.length).to be(5)
    expect(boise.breweries.first[:id]).to be_a(Integer)
    expect(boise.breweries.first[:name]).to be_a(String)
    expect(boise.breweries.first[:brew_type]).to be_a(String)
    expect(boise.forecast).to be_a(Array)
    expect(boise.forecast[:summary]).to be_a(String)
    expect(boise.forecast[:temperture]).to be_a(Integer).or(be_a(Float))
  end
end