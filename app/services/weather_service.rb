class WeatherService

  def initialize(location)
    @lat = Geolocation.new(location).coords['lat']
    @long = Geolocation.new(location).coords['lng']
  end

  def get_weather_json
    JSON.parse(connection.get.body, symbolize_names: true)
  end

  private

  def connection
    Faraday.new(
      url: 'https://api.openweathermap.org/data/2.5/onecall?',
      params: {
        appid: ENV['WEATHER_API_KEY'],
        lat: @lat,
        lon: @long,
        units: 'imperial'
      })
  end
end
