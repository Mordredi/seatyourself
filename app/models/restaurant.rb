class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :reservations

  validates :name, :seats, :open_time, :close_time, :presence => true
end
