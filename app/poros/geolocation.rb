class Geolocation
  attr_reader :id

  def initialize(location)
    @id = nil
    @location = location
  end

  def coords
    GeolocationService.new(@location).lat_and_long
  end
end
