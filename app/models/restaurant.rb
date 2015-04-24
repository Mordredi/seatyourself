class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  has_many :users, :through => :reservations

  validates :name, :seats, :open, :close, :presence => true

  private

  def hours_of_operation
    self.close - self.open
  end

end
