class Api::V1::ForecastController < ApplicationController
  def index
    render json: WeatherSerializer.new(Weather.new(params[:location]))
  end
end

 
