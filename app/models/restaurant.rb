class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  has_many :users, :through => :reservations

  validates :name, :seats, :open, :close, :presence => true

  def open_hours
    (open...close).to_a
  end

end
