require 'rails_helper'

RSpec.describe 'Current Weather' do
  it 'can return current weather' , :vcr do
      boise = {"dt": 1628524805,
                "sunrise": 1628512992,
                "sunset": 1628564245,
                "temp": 64.4,
                "feels_like": 62.56,
                "pressure": 1017,
                "humidity": 43,
                "dew_point": 41.45,
                "uvi": 2.68,
                "clouds": 0,
                "visibility": 10000,
                "wind_speed": 8.68,
                "wind_deg": 301,
                "wind_gust": 10.27,
                "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
              }]}
    data = CurrentWeather.new(boise)

    expect(data.datetime).to be_a(String)
    expect(data.sunrise).to be_a(String)
    expect(data.sunset).to be_a(String)
    expect(data.temp).to be_a(Integer).or be_a(Float)
    expect(data.feels_like).to be_a(Integer).or be_a(Float)
    expect(data.humidity).to be_a(Integer).or be_a(Float)
    expect(data.uvi).to be_a(Integer).or be_a(Float)
    expect(data.visibility).to be_a(Integer).or be_a(Float)
    expect(data.conditions).to be_a(String)
  end
end