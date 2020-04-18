class GeolocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :coords
end
