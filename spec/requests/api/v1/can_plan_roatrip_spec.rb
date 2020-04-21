require 'rails_helper'

RSpec.describe 'As a user', type: :request do
  it 'can show roadtrip details' do

    post '/api/v1/users?email=agallant121@gmail.com&password=penny&password_confirmation=penny'
    post '/api/v1/sessions?email=agallant121@gmail.com&password=penny'
    api_key = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:api_key]

    origin = 'Denver,CO'
    destination = 'Pueblo,CO'

    post '/api/v1/road_trip', params: {
       origin: origin,
       destination: destination,
       api_key: api_key
     }

    expect(response.status).to eq(200)

    result = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    expect(result[:origin]).to eq("Denver,CO")
    expect(result[:destination]).to eq("Pueblo,CO")
    expect(result[:travel_duration_text]).to eq("1 hour 48 mins")
    expect(result[:future_forecast_temperature].class).to be(Float)
    expect(result[:future_forecast_description].class).to be(String)
  end
end
