require 'rails_helper'

RSpec.describe 'As a user' do
  it 'can display lat and long' do
    roadtrip_info = Roadtrip.new('Denver, CO', 'Pueblo, CO')

    expect(roadtrip_info.travel_duration_text).to eq("1 hour 48 mins")
    expect(roadtrip_info.future_index).to be(Hash)
  end
end
