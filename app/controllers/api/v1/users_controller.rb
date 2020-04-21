class Api::V1::UsersController < ApplicationController
  def create
    # require "pry"; binding.pry
    user = User.new(user_params)
    # require "pry"; binding.pry
    if user.save
      render json: UserSerializer.new(user), status: :created
    else
      render json: user.errors.full_messages, status: :bad_request
      # require "pry"; binding.pry
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
