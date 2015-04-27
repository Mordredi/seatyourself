class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :title, :content, :presence => true
end
