require 'rails_helper'

RSpec.describe 'As a user' do
  it "gets restaurant and weather info at destination" do

    get "/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese"

    munchie = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

    expect(response).to be_successful
    expect(munchie[:finish]).to eq('pueblo,co')
    expect(munchie[:travel_time].class).to be(String)
    expect(munchie[:arrival_forecast].class).to be(String)
    expect(munchie[:get_restaurant_info_name].class).to be(String)
    expect(munchie[:get_restaurant_info_address].class).to be(String)
  end
end
