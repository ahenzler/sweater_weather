class BreweriesFacade
  class << self
    def find_city_current_weather_and_breweries(city_state_names, location, quantity)
      forecast =  WeatherFacade.find_weather_forecast(location[0], location[1]).current_weather
      breweries = BreweryService.get_breweries(location, quantity)
      Brewery.new(city_state_names, forecast, breweries)
    end
  end
end