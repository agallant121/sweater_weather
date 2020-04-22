class MunchiesService

  def initialize(finish, food_type)
    # @start = start
    @finish = finish
    @food_type = food_type
    @api_key = ENV['YELP_API_KEY']
  end


  def connection
    Faraday.new(url: "https://api.yelp.com/v3/businesses/search?term=#{@food_type}&location=#{@finish}") do |faraday|
    faraday.headers["Authorization"] = "Bearer #{@api_key}"
    end
  end

  def get_yelp_json
    conn = JSON.parse(conn.get.env[:response_body], symbolize_names: true)
    require "pry"; binding.pry
  end
end
