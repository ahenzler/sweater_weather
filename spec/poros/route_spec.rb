require 'rails_helper'

RSpec.describe 'Routes Poro' do
describe 'it instantiates and returns route' do
  it 'can take data and return an object' , :vcr do
    data = MapquestService.get_route('Eagle,ID', 'Denver,CO')
    forecast = CoordinatesFacade.ending_location_forecast("Denver,CO")

    route = Route.new(data, forecast)

    expect(route).to be_a(Route)
    expect(route.id).to be_nil
    expect(route.start_city).to be_a(String)
    expect(route.end_city).to be_a(String)
    expect(route.travel_time).to be_a(String)
    expect(route.weather_at_eta).to be_a(Hash)
    end
  end
end
