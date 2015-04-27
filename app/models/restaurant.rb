class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  has_many :reviews
  has_many :users, :through => :reservations

  validates :name, :seats, :open, :close, :presence => true

  def open_hours
    (open...close).to_a
  end

  def available?(num_of_seats, time, date)
    reservations_for_time = reservations.where(time: time, date: date)
    reservations_for_time.sum(:num_of_seats) + num_of_seats <= seats
  end

end
