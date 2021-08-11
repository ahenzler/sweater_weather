class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UsersSerializer.new(user), status: 201
    elsif User.find_by(email: params[:email])
      render json: { errors: 'That email is already in use.'}, status: :conflict
    elsif params[:password] != params[:password_confirmation]
      render json: { errors: 'Passwords do not match.'}, status: :bad_request
    else
      render json: { errors: 'Unable to create user.' }, status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :api_key)
  end
end