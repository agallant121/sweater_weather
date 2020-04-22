require 'rails_helper'

RSpec.describe 'As a user' do
  it "gets restaurant and weather info at destination" do
    munchie = MunchiesService.new('Denver,CO', 'Pueblo,CO', 'chinese')

    expect(munchie.future_arrival_value.class).to be(Integer)

  end
end
