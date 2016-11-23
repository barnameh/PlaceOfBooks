class Reservation < ActiveRecord::Base
  belongs_to :book

  validates :book_id, :loan_date, :due_date, presence: true
end
