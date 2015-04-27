require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  setup do
    @restaurant = Restaurant.create(:restaurant)
  end

  test "check availability of restaurant" do
    assert @restaurant.available?(20)
  end

end
