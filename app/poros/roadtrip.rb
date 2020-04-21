class Roadtrip
  attr_reader :id, :road_trip, :origin, :destination, :future_forecast_temperature, :future_forecast_description

  def initialize(origin, destination, api_key)
    @id = nil
    @origin = origin
    @destination = destination
    @connection ||= GoogleMapService.new(origin, destination).connection
    @api_key = "api_key: #{api_key}"
    @road_trip = @origin, @destination, @api_key
  end

  def travel_duration_text
    get_json_maps[:routes][0][:legs][0][:duration][:text]
  end

  # def get_destination_weather
  #   Weather.new(@destination).hourly_weather[0][:weather][0][:description]
  # end

  def future_time
    travel_duration_text.split.first.to_i + 1
  end

  def future_forecast_description
    Weather.new(@destination).hourly_weather[future_time][:weather][0][:description]
  end

  def future_forecast_temperature
    Weather.new(@destination).hourly_weather[future_time][:temp]
  end

  private

  def get_json_maps
    JSON.parse(@connection.get.body, symbolize_names: true)
  end
end
