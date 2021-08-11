class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UsersSerializer.new(user)
    elsif params[:email].empty? || params[:password].empty?
      render json: { errors: 'Please enter both a password and email.' }, status: :unauthorized
    else
      render json: { errors: 'Incorrect password or email.' }, status: :bad_request
    end
  end
end