require 'rails_helper'

RSpec.describe "As a user" do

  it 'gets 201 response if new user registration works' do

    post '/api/v1/users?email=agallant121@gmail.com&password=penny&password_confirmation=penny'

    expect(response.status).to eq(201)
    result = JSON.parse(response.body, symbolize_names: true)[:data]
    # require "pry"; binding.pry
    expect(result[:attributes].keys).to include(:api_key)
  end

  xit 'gets 400 response if passwords do not match' do
    post '/api/v1/users?email=agallant121@gmail.com&password=penny&password_confirmation=pnny'

    expect(response.status).to eq(400)
    result = JSON.parse(response.body, symbolize_names: true)
    expect(result[:password_confirmation][0]).to eq("doesn't match Password")
  end

  xit 'gets 400 response if passwords do not match' do
    post '/api/v1/users?email=agallant121@gmail.com&password=penny&password_confirmation=pnny'
    post '/api/v1/users?email=agallant121@gmail.com&password=penny&password_confirmation=pnny'

    expect(response.status).to eq(400)
    result = JSON.parse(response.body, symbolize_names: true)
    expect(result[:email][0]).to eq("make an error on purpose")
  end
end
