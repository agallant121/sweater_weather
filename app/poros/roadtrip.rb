class Roadtrip
  attr_reader :id, :road_trip

  def initialize(origin, destination, api_key)
    @id = nil
    @origin = origin
    @destination = destination
    @connection ||= GoogleMapService.new(origin, destination).connection
    @api_key = "api_key: #{api_key}"
    @road_trip = @origin, @destination, @api_key
  end

  def get_json_maps
    JSON.parse(@connection.get.body, symbolize_names: true)
  end

  def travel_duration_text
    get_json_maps[:routes][0][:legs][0][:duration][:text]
  end

  def get_destination_weather
    Weather.new(@destination).hourly_weather[0][:weather][0][:description]
  end

  # def travel_duration_numbers
  #   get_json_maps[:routes][0][:legs][0][:duration][:value]
  # end

  # def future_index
  #   x = (travel_duration_numbers / 360.to_f).ceil
  #   x - 1
  #   # require "pry"; binding.pry
  # end
end
