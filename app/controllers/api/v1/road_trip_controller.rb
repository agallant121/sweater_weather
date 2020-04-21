class Api::V1::RoadTripController < ApplicationController
  def create
    # require "pry"; binding.pry
    user = User.find_by(auth_token: params[:api_key])
    if user
      road_trip = Roadtrip.new(params[:origin], params[:destination])
      render json: RoadtripSerializer.new(road_trip)
    else
      render json: {message: 'Invalid Key'}, status: :unauthorized
    end
  end
end
