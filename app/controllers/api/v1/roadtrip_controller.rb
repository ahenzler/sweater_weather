class Api::V1::RoadtripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      road_trip = CoordinatesFacade.get_route(params[:origin], params[:destination])
      render json: RoadtripSerializer.new(road_trip)
    else
      render json: { errors: "Invalid API key." }, status: :unauthorized
    end
  end
end