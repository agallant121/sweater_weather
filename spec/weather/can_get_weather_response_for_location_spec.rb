require 'rails_helper'

RSpec.describe 'As a user', type: :request do
  it "gets weather when called for a location" do
    location = 'Denver, CO'

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful
    info = JSON.parse(response.body, symbolize_names: true)
    expect(info[:data][:attributes].keys).to eq([:id, :hourly_weather, :current_weather, :future_daily_forecast])
  end
end
