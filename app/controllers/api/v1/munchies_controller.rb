class Api::V1::MunchiesController < ApplicationController
  def index
    # require "pry"; binding.pry
    render json: MunchiesSerializer.new(Munchies.new(params['start'], params['end'], params['food']))
  end
end
