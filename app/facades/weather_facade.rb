class WeatherFacade
  class << self
    def find_weather_forecast(lat, long)
      json = WeatherService.get_weather(lat, long)
      WeatherForecast.new(json)
    end
  end
end