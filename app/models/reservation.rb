class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user

  validates :time, :num_of_seats, :presence => true

end
