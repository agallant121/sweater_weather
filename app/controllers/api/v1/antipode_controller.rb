class Api::V1::AntipodeController < ApplicationController
  def index
    render json: AntipodeSerializer.new(Antipode.new(params[:location]))
    # require "pry"; binding.pry
  end
end
