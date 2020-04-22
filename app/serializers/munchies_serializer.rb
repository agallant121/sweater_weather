class MunchiesSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :finish, :travel_time, :arrival_forecast, :get_restaurant_info_name, :get_restaurant_info_address
end
