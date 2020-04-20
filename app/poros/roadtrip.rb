class Roadtrip

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
    @connection ||= GoogleMapService.new(origin, destination).connection
  end

  def get_json_maps
    JSON.parse(@connection.get.body, symbolize_names: true)
  end

  def travel_duration_text
    get_json_maps[:routes][0][:legs][0][:duration][:text]
  end

  def travel_duration_numbers
    get_json_maps[:routes][0][:legs][0][:duration][:value]
  end

  def get_destination_weather
    x = Weather.new(@destination).hourly_weather
    # require "pry"; binding.pry
  end

  def future_index
    x = (travel_duration_numbers / 360.to_f).ceil
    x - 1
    require "pry"; binding.pry
  end

  def future_weather

  end
end
