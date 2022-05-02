class Api::V1::RoadtripController < ApplicationController
  def create

      road_trip = CoordinatesFacade.get_route(params[:origin], params[:destination])
      render json: RoadtripSerializer.new(road_trip)

  end
end