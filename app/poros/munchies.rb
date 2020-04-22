class Munchies
  attr_reader :id, :end_location, :travel_time, :forecast, :restaurant

  def initialize(start, finish, food_type)
    @id = nil
    @start = start
    @end_location = finish
    @food_type = food_type
    @yelp_info = MunchiesService.new(start, finish, food_type).get_yelp_json
    @yelp_restaurant = MunchiesService.new(start, finish, food_type).get_restaurant_json
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
  end

  def travel_time
    @road_trip_info[:routes][0][:legs][0][:duration][:text]
  end

  def future_time
    travel_time.split.first.to_i + 1
  end

  def forecast
    Weather.new(@end_location).hourly_weather[future_time][:weather][0][:description]
  end

  def name
    @yelp_restaurant[:businesses][0][:name]
  end

  def address
    @yelp_restaurant[:businesses][0][:location][:address1]
  end

  def restaurant
    {
      name: name,
      address: address
    }

  end
end
