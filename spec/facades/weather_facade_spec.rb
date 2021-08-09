require 'rails_helper'

RSpec.describe 'WeatherFacade' do
    it 'can return the weather', :vcr do
        location = CoordinatesFacade.find_coordinates("Boise,ID")

        response = WeatherFacade.find_weather_forecast(location.lat, location.long)

        expect(response).to be_a(WeatherForecast)
        expect(response.current_weather).to be_a(CurrentWeather)
        expect(response.hourly_weather).to be_a(Array)
        expect(response.hourly_weather.first).to be_a(HourlyWeather)
        expect(response.daily_weather).to be_a(Array)
        expect(response.daily_weather.first).to be_a(DailyWeather)
    end
end
