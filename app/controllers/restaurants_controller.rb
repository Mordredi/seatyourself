class RestaurantsController < ApplicationController

  before_filter :restaurant_owner, :only => [:edit, :update, :delete]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])

    if current_user
      @reservation = @restaurant.reservations.build
    end
    
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
    @user = current_user
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @user = current_user
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
    params.require(:restaurant).permit(:name, :seats, :open, :close, :address, :image_url, :description, :website)
  end

end
