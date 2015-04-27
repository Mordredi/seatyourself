class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  has_many :reviews
  has_many :users, :through => :reservations

  validates :name, :seats, :open, :close, :presence => true

  def open_hours
    (open...close).to_a
  end

  def available?(num_of_seats)
  end

end
