class AntipodeService

  def initialize(location)
    @location = Geolocation.new(location).coords
    @lat = @location["lat"]
    @long = @location["lng"]
  end

  def connection

    conn = Faraday.new(url: "http://amypode.herokuapp.com/api/v1/antipodes?lat=#{@lat}&#{@long}=-82") do |faraday|
      faraday.headers["API_KEY"] = ENV['ANTIPODE_API_KEY']
    end

    json = JSON.parse(conn.get.body, symbolize_names: true)

    # response = conn.get("/api/v1/antipodes?lat=#{@lat}&#{@long}=-82")
    require "pry"; binding.pry
      # json = JSON.parse(conn.get.body, symbolize_names: true)
      # require "pry"; binding.pry
  end
end
