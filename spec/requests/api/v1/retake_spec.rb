require 'rails_helper'
​
RSpec.describe 'As a user', type: :request do
  it "gets restaurant and weather info at destination" do
    # start = "denver,co"
    # finish = "pueblo,co"
    # food_type = "chinese"

# ​     munchie = MunchiesService.new(start, finish, food_type)

    expect(munchie.connection.class).to be(Integer)

    # get "/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese"
​
    # expect(response).to be_successful
​
#     response_info = {
#                       "data": {
#                               "id": "null",
#                               "type": "munchie",
#                               "attributes": {
#                                   "end_location": "Pueblo, CO",
#                                   "travel_time": "1 hours 48 min",
#                                   "forecast": "Cloudy with a chance of meatballs",
# ​
#                                     "restaurant": {
#                                       "name": "Chinese Restaurant",
#                                       "address": "4602 N. Elizabeth St, Ste 120, Pueblo, CO 81008"
#                           }
#                         }
#                       }
#                     }
# ​
#       result = JSON.parse(response.body, symbolize_names: true)
#       expect(result).to eq(response_info)
​
    # info = JSON.parse(response.body, symbolize_names: true)
    # expect(info[:data][:attributes].keys).to eq([:id, :hourly_weather, :current_weather, :future_daily_forecast])
  end
end
