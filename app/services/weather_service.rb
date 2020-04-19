class WeatherService

  def initialize(location)
    @lat = Geolocation.new(location).coords['lat']
    @long = Geolocation.new(location).coords['lng']
  end

  def connection
    conn = Faraday.new(
      url: 'https://api.openweathermap.org/data/2.5/onecall?',
      params: {
        appid: ENV['WEATHER_API_KEY'],
        lat: @lat,
        lon: @long
      })

    json = JSON.parse(conn.get.body, symbolize_names: true)
    return json
  end
end
