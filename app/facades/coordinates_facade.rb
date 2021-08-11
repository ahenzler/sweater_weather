class CoordinatesFacade
  class << self
    def find_coordinates(location)
      json = MapquestService.get_address_location(location)
      data = json[:results].first[:locations].first[:latLng]
      Location.new(data)
    end

    def get_route(starting_location, ending_location)
      json = MapquestService.get_route(starting_location, ending_location)
      if json[:info][:statuscode] != 0
        render json: { errors: "Invalid Route." }, status: :bad_request
      else
        data = json[:route]
        forecast = ending_location_forecast(ending_location)
        Route.new(data, forecast)
      end
    end

    def ending_location_forecast(ending_location)
      location = CoordinatesFacade.find_coordinates(ending_location)
      WeatherFacade.find_weather_forecast(location.lat, location.long)
    end
  end
end