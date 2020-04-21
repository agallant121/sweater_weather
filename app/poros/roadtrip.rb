class Roadtrip
  attr_reader :id, :origin, :destination, :future_forecast_temperature, :future_forecast_description, :travel_duration_text

  def initialize(origin, destination)
    @id = nil
    @origin = origin
    @destination = destination
    @road_trip_info ||= GoogleMapService.new(origin, destination).get_json_maps
  end

  def travel_duration_text
    @road_trip_info[:routes][0][:legs][0][:duration][:text]
  end

  def future_time
    travel_duration_text.split.first.to_i + 1
  end

  def future_forecast_description
    Weather.new(@destination).hourly_weather[future_time][:weather][0][:description]
  end

  def future_forecast_temperature
    Weather.new(@destination).hourly_weather[future_time][:temp]
  end
end
