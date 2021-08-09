class Api::V1::BreweriesController < ApplicationController
  def index
    if params[:location] && params[:quantity]
      location = CoordinatesFacade.find_coordinates(:location)
      brewery = BreweriesFacade.find_city_current_weather_and_breweries(params[:location], [location.lat, location.long], params[:quantity])
      render json: BrewerySerializer.new(brewery)
    else
      render json: { error: 'Please provide a location and quantity' }, status: :bad_request
    end
  end
end