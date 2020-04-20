class PhotoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :forecast, :city_name
end
