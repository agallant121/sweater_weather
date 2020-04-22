require 'rails_helper'

RSpec.describe 'As a user' do
  it "gets restaurant and weather info at destination" do
    munchie = MunchiesService.new('Pueblo,CO', 'chinese')

    expect(munchie.get_yelp_json.class).to be(Integer)

  end
end
