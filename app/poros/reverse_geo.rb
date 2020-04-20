class ReverseGeo
    def initialize(lat, long)
      @lat = lat
      @long = long
      @connection = ReverseGeoService.new(@lat, @long).connection
    end


    def get_city_name
      get_reverse_geo_json[:results][0][:address_components][2][:long_name]
    end

    private

    def get_reverse_geo_json
      JSON.parse(@connection.get.body, symbolize_names: true)
    end
end
