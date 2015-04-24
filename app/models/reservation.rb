class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user

  validates :date, :time, :num_of_seats, :presence => true

end
