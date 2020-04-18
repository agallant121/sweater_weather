require 'rails_helper'

RSpec.describe 'google location services' do
  it 'can display lat and long' do
    location = GeolocationService.new('Denver')

    expect(location.lat_and_long.count).to eq(2)
  end

  it 'has geolocation information' do
    location = 'Denver'
    x = Geolocation.new(location)

    expect(x.coords.count).to eq(2)
  end
end
