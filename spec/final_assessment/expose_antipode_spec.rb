require 'rails_helper'

RSpec.describe 'As a user', type: :request do
  it "gets weather when called for a location" do
    location = 'Hong Kong'

    get "/api/v1/antipode?location=#{location}"

    expect(response).to be_successful
    expect(antipode_info.get_coords.keys.count).to eq(2)
    expect(antipode_info.get_coords.keys.first).to eq(:lat)
    expect(antipode_info.get_coords.keys.last).to eq(:long)
    ##more tests were about to be written
  end
end
