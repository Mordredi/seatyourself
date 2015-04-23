class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurants.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @user = current_user
    @restaurant = @user.restaurants.build(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_url(@restaurant)
    else
      render 'new'
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurant_url(@restaurant)
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_url
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :seats, :open_time, :close_time, :address, :image_url, :description)
  end

end