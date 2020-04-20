require 'rails_helper'

RSpec.describe 'antipode' do
  it 'can display antipode information' do
    antipode_info = AntipodeService.new('Hong Kong')

    expect(antipode_info.connection.current_weather.class).to be(String)
    expect(antipode_info.city_name.class).to be(String)
  end
end
