class Munchies
  attr_reader :id, :finish,
  def initialize(start, finish, food_type)
    @id = nil
    @start = start
    @finish = finish
    @food_type = food_type
    @yelp_info = MunchiesService.new(start, finish, food_type).get_yelp_json
    @road_trip_info ||= GoogleMapService.new(start, finish).get_json_maps
  end

  def future_arrival_value
    x = @road_trip_info[:routes][0][:legs][0][:duration][:value]
    y = x / 60
    z = y / 60
    time_now = z + 1
    future_time = Time.now + time_now
    arrival_time = future_time.to_i
    return arrival_time
  end

  def end_location
    @road_trip_info[:routes][0][:legs][0][:end_address]
    require "pry"; binding.pry
  end

  # def travel_time
  #   @road_trip_info[:routes][0][:legs][0][:duration][:text]
  #   require "pry"; binding.pry
  # end
end
