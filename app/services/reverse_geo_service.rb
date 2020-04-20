class ReverseGeoService
  def initialize(lat, long)
    @lat = lat
    @long = long
  end

  def connection
    Faraday.new(
      url: "https://maps.googleapis.com/maps/api/geocode/json?latlng=#{@lat}, #{@long}",
      params: {
        key: ENV['GOOGLE_API_KEY'],
        # latlng: @lat, @long,
      })
  end
end
