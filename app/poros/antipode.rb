class Antipode
  def initialize(location)
    @id = nil
    @connection = AntipodeService.new(location).connection
    @forecast = Weather.new(location).current_weather
    @city_name = ReverseGeo(Antipode)
    @coords = Geolocation.new(location).coords
  end

  def get_coords
    get_antipode_json[:attributes]
  end

  def get_lat
    get_antipode_json[:attributes][:lat]
  end

  def get_long
    get_antipode_json[:attributes][:long]
  end

  def get_string_of_lat_and_long
    get_antipode_json.values.join(",")
  end

  private

  def get_antipode_json
    JSON.parse(@connection.get.body, symbolize_names: true)[:data]
  end
end
