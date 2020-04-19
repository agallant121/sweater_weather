class Weather
  attr_reader :id

  def initialize(location)
    @id = nil
    @connection = WeatherService.new(location).connection
  end

  def current_weather
    @connection[:current]
  end

  def hourly_weather
    @connection[:hourly]
  end

  def future_daily_forecast
    @connection[:daily]
  end

end
