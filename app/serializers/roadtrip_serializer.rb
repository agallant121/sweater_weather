class RoadtripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :origin,
             :destination,
             :travel_duration_text,
             :future_forecast_temperature,
             :future_forecast_description
end
