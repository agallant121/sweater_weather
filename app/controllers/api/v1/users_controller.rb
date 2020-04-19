class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    # require "pry"; binding.pry
    if user.save
      render json: UserSerializer.new(user), status: :created
    else
      render json: user.errors, status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
