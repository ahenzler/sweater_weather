require 'rails_helper'

RSpec.describe 'WeatherForecast' do
  it 'should return a forecast', :vcr do
    location = CoordinatesFacade.find_coordinates('Boise,ID')
    data = WeatherService.get_weather(location.lat, location.long)

    boise = WeatherForecast.new(data)

    expect(boise.id).to be_nil
    expect(boise.current_weather).to be_instance_of(CurrentWeather)

    expect(boise.hourly_weather).to be_a(Array)
    expect(boise.hourly_weather.first).to be_instance_of(HourlyWeather)
    expect(boise.hourly_weather.count).to be(8)

    expect(boise.daily_weather).to be_a(Array)
    expect(boise.daily_weather.first).to be_instance_of(DailyWeather)
    expect(boise.daily_weather.count).to be(5)
  end
end