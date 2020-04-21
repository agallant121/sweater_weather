class PhotoService
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def get_json
    JSON.parse(connection.get.body, symbolize_names: true)
  end

  private

  def connection
    Faraday.new(
      url: 'https://api.unsplash.com/search/?',
      params: {
        client_id: ENV['PHOTO_API_KEY'],
        query: @location
      })
  end
end
