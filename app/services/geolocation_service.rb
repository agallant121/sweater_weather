class GeolocationService
  attr_reader :lat, :long

  def initialize(location)
    @location = location
    @lat = lat_and_long['lat']
    @long = lat_and_long['lng']
  end

  def lat_and_long
    JSON.parse(connection.get.body)['results'][0]['geometry']['location']
  end

  def connection
    return @conn if @conn
      @conn = Faraday.new(
        url: 'https://maps.googleapis.com/maps/api/geocode/json?',
        params: {
                key: ENV['GOOGLE_API_KEY'],
                address: @location
              })
  end
  
end
