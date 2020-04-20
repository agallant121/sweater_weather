require 'rails_helper'

RSpec.describe 'antipode' do
  it 'can display antipode information' do
    antipode_info = Antipode.new('Hong Kong')

    expect(antipode_info.get_coords.keys.count).to eq(2)
    expect(antipode_info.get_coords.keys.first).to eq(:lat)
    expect(antipode_info.get_coords.keys.last).to eq(:long)
  end

  it "can reverse geocode coords to give city name" do
    antipode_info = Antipode.new('Hong Kong')
    reverse_city = ReverseGeo.new(antipode_info.get_lat, antipode_info.get_long)

    expect(reverse_city.get_reverse_geo_json).to eq("String")
  end
end
