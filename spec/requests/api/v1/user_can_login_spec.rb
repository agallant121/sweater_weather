require 'rails_helper'

RSpec.describe 'As a user' do
  it "user can login successfully" do
    post '/api/v1/users?email=agallant121@gmail.com&password=penny&password_confirmation=penny'
    ## User needed to register before I could log them in; found that out the hard way!
    post '/api/v1/sessions?email=agallant121@gmail.com&password=penny'

    expect(response.status).to eq(200)
    result = JSON.parse(response.body, symbolize_names: true)[:data]
    # require "pry"; binding.pry
    expect(result[:attributes].keys).to include(:api_key)
  end

  it "will render an error with bad credentials" do
    post '/api/v1/users?email=agallant121@gmail.com&password=penny&password_confirmation=penny'
    post '/api/v1/sessions?email=agallant121@gmail.com&password=pnny'

    expect(response.status).to eq(400)
    result = JSON.parse(response.body, symbolize_names: true)
    # require "pry"; binding.pry
    expect(result[:message]).to eq('invalid request')
  end
end
