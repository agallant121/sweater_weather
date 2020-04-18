require 'rails_helper'

RSpec.describe 'google location services' do
  it 'can display lat and long' do
    location = GeolocationService.new('Denver')

    expect(location.lat).to eq(39.7392358)
    expect(location.long).to eq(-104.990251)
  end
end
