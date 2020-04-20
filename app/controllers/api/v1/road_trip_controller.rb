class Api::V1::RoadTripController < ApplicationController
  def create
    render json: RoadtripSerializer.new(Roadtrip.new(params[:origin],
                                                     params[:destination],
                                                     params[:api_key][:api_key]))
  end
end
