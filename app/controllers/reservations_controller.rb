class ReservationsController < ApplicationController
  before_filter :load_restaurant

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      redirect_to restaurant_url(@restaurant), :notice => 'Reservation Successfully Made'
    else
      redirect_to restaurant_url(@restaurant), :alert => 'Reservation not available for the number requested.'
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to user_url(current_user)
  end

  private
  def reservation_params
    params.require(:reservation).permit(:num_of_seats, :time, :date)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
