class Antipode
  def initialize(location)
    @coords = Geolocation.new(location).coords
    @id = nil
    @antipode = AntipodeService.new(@coords).get_antipode_json
    @forecast = Weather.new(location).current_weather
    @city_name = ReverseGeo(Antipode)
  end

  def get_coords
    @antipode[:attributes]
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

  # def get_antipode_json
  #   JSON.parse(@connection.get.body, symbolize_names: true)[:data]
  # end
end
