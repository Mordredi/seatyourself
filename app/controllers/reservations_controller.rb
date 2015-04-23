class ReservationsController < ApplicationController
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
      redirect_to restaurant_url(@restaurant)
    else
      render 'new'
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to user_url(current_user)
  end

  private
  def reservation_params
    params.require(:reservation).permit(:num_of_seats, :time)
  end

end
