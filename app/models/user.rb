class User < ActiveRecord::Base
  has_secure_password

  validates :email, :presence => true
  validates :email, :uniqueness => true

  has_many :restaurants
  has_many :reservations
end
