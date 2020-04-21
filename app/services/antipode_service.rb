class AntipodeService

  def initialize(coords)
    # @location = location
    @lat = coords["lat"]
    @long = coords["lng"]
  end

  def get_antipode_json
    JSON.parse(connection.get.body, symbolize_names: true)[:data]
  end

  def connection
    Faraday.new(url: "http://amypode.herokuapp.com/api/v1/antipodes?lat=#{@lat}&long=#{@long}") do |faraday|
      faraday.headers["API_KEY"] = ENV['ANTIPODE_API_KEY']
    end
  end
end
