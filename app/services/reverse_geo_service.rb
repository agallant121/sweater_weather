class ReverseGeoService
  def initialize(lat, long)
    @lat = lat
    @long = long
  end

  def connection
    conn = Faraday.new(
      url: 'https://maps.googleapis.com/maps/api/geocode/json?',
      params: {
        key: ENV['GOOGLE_API_KEY'],
        latlng: @lat,@long
      })

      require "pry"; binding.pry
  end
end
