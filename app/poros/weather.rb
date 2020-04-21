class Weather
  attr_reader :id

  def initialize(location)
    @id = nil
    @weather_info ||= WeatherService.new(location).get_weather_json
  end

  def current_weather
    @weather_info[:current]
  end

  def hourly_weather
    @weather_info[:hourly]
  end

  def future_daily_forecast
    @weather_info[:daily]
  end
end
