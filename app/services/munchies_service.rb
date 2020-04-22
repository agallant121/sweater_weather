class MunchiesService

  def initialize(start, finish, food_type)
    @start = start
    @finish = finish
    @food_type = food_type
    @api_key = ENV['YELP_API_KEY']
  end

  def get_yelp_json
    JSON.parse(connection.get.env[:response_body], symbolize_names: true)
  end

  private

  def connection
    Faraday.new(url: "https://api.yelp.com/v3/businesses/search?term=#{@food_type}&location=#{@finish}") do |faraday|
      faraday.headers["Authorization"] = "Bearer #{@api_key}"
    end
  end

  def arrival_info
    Faraday.new(url: "https://api.yelp.com/v3/businesses/search?term=#{@food_type}&location=#{@finish}&open_at=") do |faraday|
      faraday.headers["Authorization"] = "Bearer #{@api_key}"
    end
  end

  def get_arrival_json(future_arrival_value)
    response = connection.get do |request|
      request.params['location'] = @destination
      request.params['term'] = @food_type
      request.params['open_at'] = future_arrival_value
    end
    json = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
  end

end
