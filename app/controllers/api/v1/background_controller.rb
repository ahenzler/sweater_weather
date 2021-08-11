class Api::V1::BackgroundController < ApplicationController
  def index
    if params[:location]
      background = BackgroundFacade.get_image_url(params[:location])
      render json: BackgroundImageSerializer.new(background)
    else
      render json: { error: 'Please provide a location' }, status: :bad_request
    end
  end
end