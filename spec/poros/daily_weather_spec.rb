require 'rails_helper'

RSpec.describe 'Daily Weather' do
  it 'can return daily weather', :vcr do
    boise = { "dt": 1628535600,
              "sunrise": 1628512992,
              "sunset": 1628564245,
              "moonrise": 1628516460,
              "moonset": 1628568300,
              "moon_phase": 0.04,
              "temp": {
                  "day": 72.48,
                  "min": 56.53,
                  "max": 84.07,
                  "night": 70.09,
                  "eve": 82.85,
                  "morn": 59.16
              },
              "feels_like": {
                  "day": 70.75,
                  "night": 68.07,
                  "eve": 80.31,
                  "morn": 56.71
              },
              "pressure": 1016,
              "humidity": 28,
              "dew_point": 37.56,
              "wind_speed": 11.65,
              "wind_deg": 304,
              "wind_gust": 12.53,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01d"
                  }
              ],
              "clouds": 0,
              "pop": 0,
              "uvi": 7.89}
    data = DailyWeather.new(boise)

    expect(data.date).to be_a(String)
    expect(data.sunrise).to be_a(String)
    expect(data.sunset).to be_a(String)
    expect(data.max_temp).to be_a(Integer).or be_a(Float)
    expect(data.min_temp).to be_a(Integer).or be_a(Float)
    expect(data.conditions).to be_a(String)
  end
end
