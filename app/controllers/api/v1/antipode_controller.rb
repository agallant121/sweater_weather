class Api::V1::AntipodeController < ApplicationController
  def index
    require "pry"; binding.pry
    render json: AntipodeSerializer.new(Antipode.new(params[:location]))
  end
end
