class Book < ActiveRecord::Base
  has_many :reservations

  validates :title, presence: true

  def update_availability
    if self.reservations.where("return_date IS NULL").empty?
      self.available = true
    else
      self.available = false
    end
    self.save!
  end
end
