require 'rails_helper'

RSpec.describe 'weather services' do
  it 'can display lat and long' do
    weather_info = Weather.new('Denver')

    expect(weather_info.current_weather.count.class).to be(Integer)
    expect(weather_info.future_daily_forecast.count.class).to be(Integer)
    expect(weather_info.hourly_weather.count.class).to be(Integer)
  end
end
