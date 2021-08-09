class Api::V1::ForecastWeatherController < ApplicationController
  def index
    if params[:location]
      location = CoordinatesFacade.find_coordinates(params[:location])
      weather = WeatherFacade.find_weather_forecast(location.lat, location.long)
      render json: ForecastSerializer.new(weather)
    else
      render json: { error: 'Please provide a location' }, status: :bad_request
    end
  end
end