class AntipodeService

  def initialize(location)
    @location = Geolocation.new(location).coords
    @lat = @location["lat"]
    @long = @location["lng"]
  end

  def connection
    Faraday.new(url: "http://amypode.herokuapp.com/api/v1/antipodes?lat=#{@lat}&#{@long}=-82") do |faraday|
      faraday.headers["API_KEY"] = ENV['ANTIPODE_API_KEY']
    end
  end
end
