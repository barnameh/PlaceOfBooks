class Book < ActiveRecord::Base
  has_many :reservations

  validates :title, presence: true
end
