class WeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :hourly_weather, :current_weather, :future_daily_forecast
end
