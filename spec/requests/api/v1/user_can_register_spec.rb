require 'rails_helper'

RSpec.describe "As a user" do

  it 'gets 201 response if new user registration works' do

    post '/api/v1/users?email=agallant121@gmail.com&password=penny&password_confirmation=penny'

    expect(response.status).to eq(201)
    result = JSON.parse(response.body, symbolize_names: true)[:data]
    # require "pry"; binding.pry
    expect(result[:attributes].keys).to include(:api_key)
  end

  it 'gets 400 response if passwords do not match' do
    post '/api/v1/users?email=agallant121@gmail.com&password=penny&password_confirmation=pnny'

    expect(response.status).to eq(400)
    result = JSON.parse(response.body, symbolize_names: true)
    # require "pry"; binding.pry
    expect(result[0]).to eq("Password confirmation doesn't match Password")
  end

  it 'gets 400 response if email is not unique' do
    post '/api/v1/users?email=agallant121@gmail.com&password=penny&password_confirmation=penny'
    post '/api/v1/users?email=agallant121@gmail.com&password=penny&password_confirmation=penny'

    expect(response.status).to eq(400)
    result = JSON.parse(response.body, symbolize_names: true)
    # require "pry"; binding.pry
    expect(result[0]).to eq("Email has already been taken")
  end
end
