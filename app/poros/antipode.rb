class Antipode
  def initialize(location)
    @id = nil
    @connection = AntipodeService.new(location).connection
  end

  def get_antipode_json
    JSON.parse(@connection.get.body, symbolize_names: true)[:data]
  end

  def get_coords
    # require "pry"; binding.pry
    get_antipode_json[:attributes]
  end

  def get_lat
    get_antipode_json[:attributes][:lat]
  end

  def get_lat
    get_antipode_json[:attributes][:long]
  end
end
