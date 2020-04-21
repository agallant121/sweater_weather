class GeolocationService

  def initialize(location)
    @location = location
  end

  def lat_and_long
    JSON.parse(connection.get.body)['results'][0]['geometry']['location']
  end

  private

  def connection
    Faraday.new(
      url: 'https://maps.googleapis.com/maps/api/geocode/json?',
      params: {
              key: ENV['GOOGLE_API_KEY'],
              address: @location
            })
  end
end
