class RoadtripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :road_trip,
             :origin,
             :destination,
             :future_forecast_temperature,
             :future_forecast_description
end
