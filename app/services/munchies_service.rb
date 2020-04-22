class MunchiesService

  def initialize(start, finish, food_type)
    @start = start
    @finish = finish
    @food_type = food_type
    @api_key = ENV['YELP_API_KEY']
    @arrival_time = Munchies.new(start, finish, food_type).future_arrival_value
  end

  def get_yelp_json
    JSON.parse(connection.get.env[:response_body], symbolize_names: true)
  end

  # def get_yelp_arrival_info
  #   x = JSON.parse(arrival_info.get.env[:response_body], symbolize_names: true)
  #   require "pry"; binding.pry
  # end

  private

  def connection
    Faraday.new(url: "https://api.yelp.com/v3/businesses/search?term=#{@food_type}&location=#{@finish}") do |faraday|
      faraday.headers["Authorization"] = "Bearer #{@api_key}"
    end
  end

  # def arrival_info
  #   Faraday.new(url: "https://api.yelp.com/v3/businesses/search?term=#{@food_type}&location=#{@finish}&open_at=#{@arrival_time}") do |faraday|
  #     faraday.headers["Authorization"] = "Bearer #{@api_key}"
  #   end
  # end

end
