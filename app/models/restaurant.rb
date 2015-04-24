class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  has_many :users, :through => :reservations

  validates :name, :seats, :open_time, :close_time, :presence => true

  private

  def check_capacity
    self.reservations.num_of_seats.sum
  end

  def self.hours_of_operation
    self.close_time - self.open_time
  end
end
