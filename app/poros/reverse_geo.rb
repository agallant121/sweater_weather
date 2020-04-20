class ReverseGeo
    def initialize(lat, long)
      @lat = lat
      @long = long
      @connection = ReverseGeoService.new(@lat, @long).connection
    end

    def get_reverse_geo_json
      x = JSON.parse(@connection.get.body, symbolize_names: true)
      require "pry"; binding.pry
    end
end
