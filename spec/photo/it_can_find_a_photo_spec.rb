require 'rails_helper'

RSpec.describe 'photo services' do
  it 'can display photo url' do
    location_photo = Photo.new('Denver')

    expect(location_photo.photo_url.class).to be(String)
  end
end
