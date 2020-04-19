require 'rails_helper'

RSpec.describe 'As a user', type: :request do
  it "gets background photo for location" do
    location = 'Denver, CO'

    get "/api/v1/backgrounds?location=#{location}"

    expect(response).to be_successful
    image_url = JSON.parse(response.body, symbolize_names: true)
    expect(image_url[:data][:attributes].keys).to eq([:id, :photo_url])
  end
end
