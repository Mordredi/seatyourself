class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user

  validates :time, :num_of_seats, :presence => true

  before_create :check_capacity

  private

  def check_capacity
    counter = 0
    restaurant = Restaurant.find(self.restaurant.id)
    capacity = restaurant.seats
    reservations = Reservation.where(:restaurant_id => restaurant.id, :time => self.time, :date => self.date)
    reservations.each do |reservation|
      counter += reservation.num_of_seats
    end
    if counter + self.num_of_seats <= capacity
      true
    else
      false
    end
  end

end
