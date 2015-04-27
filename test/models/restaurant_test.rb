require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  setup do
    @restaurant = create(:restaurant)
    @time = 12
    @date = DateTime.new(2015, 04, 27)
  end

  # availabilty?

  test "check availability of restaurant when reservation less than capacity" do
    assert @restaurant.available?(@restaurant.seats - 1, @time, @date)
  end

  test "check availability of restaurant when reservation greater than capacity" do
    refute @restaurant.available?(@restaurant.seats + 1, @time, @date)
  end

  test "check availability of restaurant when reservation equal to capacity" do
    assert @restaurant.available?(@restaurant.seats, @time, @date)
  end

  # availability? + reservation time

  test "check availabilty at a certain time of day when not full" do
    create_restaurant
    assert @restaurant.available?(20, @time, @date)
  end

  test "restaurant is not available when reservations plus party size do not fit" do
    create(:reservation, restaurant: @restaurant, time: @time, date: @date)
    refute @restaurant.available?(97, @time, @date)
  end

  #availability? + time + date

  test "check availabilty on a day at a certain time of day when not full" do
    create_restaurant
    assert @restaurant.available?(20, @time, @date)
  end

  test "restaurant is not available when reservations plus party size do not fit on a certain day" do
    create(:reservation, restaurant: @restaurant, time: @time, date: @date)
    refute @restaurant.available?(97, @time, @date)
  end

  private
  def create_restaurant
    create(:reservation, restaurant: @restaurant)
  end

end
