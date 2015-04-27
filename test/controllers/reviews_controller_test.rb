require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  test "should create new review" do
    @restaurant = Restaurant.create(name: 'The Saint', seats: 100)
    @user = User.create(first_name: 'Frodo', last_name: 'Baggins', email: 'bilbo@lotr.net', password: 'yahoo!', password_confirmation: 'yahoo!')
    assert_difference('Review.count', +1) do
      post :create, review: {title: 'Test', content: 'Testing testing' }, restaurant_id: @restaurant.id, user_id: @user.id
      binding.pry
    end

    assert_redirected_to restaurant_url(@restaurant)
  end

end
