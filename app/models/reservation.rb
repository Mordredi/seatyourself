class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user

  validates :time, :num_of_seats, :presence => true

  before_save :check_capacity

  private

  def check_capacity
    restaurant.available?(num_of_seats, time, date)
  end

end
