class ReviewsController < ApplicationController
  before_filter :load_restaurant

  def create
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      redirect_to restaurant_url(@restaurant), :notice => 'Review successfully created'
    else
      redirect_to restaurant_url(@restaurant), :alert => 'Review did not save. Please try again.'
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :content)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
