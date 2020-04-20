class GoogleMapService

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def connection
    conn = Faraday.new(
      url: 'https://maps.googleapis.com/maps/api/directions/json?',
      params: {
        key: ENV['GOOGLE_API_KEY'],
        origin: @origin,
        destination: @destination
      })
  end
end
