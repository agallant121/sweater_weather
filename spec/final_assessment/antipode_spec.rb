require 'rails_helper'

RSpec.describe 'antipode' do
  it 'can display antipode information' do
    antipode_info = Antipode.new('Hong Kong')

    expect(antipode_info.get_coords.keys.count).to eq(2)
    expect(antipode_info.get_coords.keys.first).to eq(:lat)
    expect(antipode_info.get_coords.keys.last).to eq(:long)
  end
end
