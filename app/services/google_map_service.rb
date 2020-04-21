class GoogleMapService

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def get_json_maps
    JSON.parse(connection.get.body, symbolize_names: true)
  end

  private

  def connection
    Faraday.new(
      url: 'https://maps.googleapis.com/maps/api/directions/json?',
      params: {
        key: ENV['GOOGLE_API_KEY'],
        origin: @origin,
        destination: @destination
      })
  end
end
