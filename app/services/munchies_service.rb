class MunchiesService

  def initialize(start, finish, food_type)
    @start = start
    @finish = finish
    @food_type = food_type
    @api_key = ENV['YELP_API_KEY']
  end

  def value
    x = Roadtrip.new(start, finish)
    y = x.future_arrival_value
    return y
  end

  def get_yelp_json
    JSON.parse(connection.get.env[:response_body], symbolize_names: true)
  end

  def get_restaurant_json
    JSON.parse(future_restaurant.get.env[:response_body], symbolize_names: true)
  end

  private

  def connection
    Faraday.new(url: "https://api.yelp.com/v3/businesses/search?term=#{@food_type}&location=#{@finish}") do |faraday|
      faraday.headers["Authorization"] = "Bearer #{@api_key}"
    end
  end

  def future_restaurant
    Faraday.new(url: "https://api.yelp.com/v3/businesses/search?term=#{@food_type}&location=#{@finish}&open_at=#{@value}") do |faraday|
      faraday.headers["Authorization"] = "Bearer #{@api_key}"
    end
  end
end
