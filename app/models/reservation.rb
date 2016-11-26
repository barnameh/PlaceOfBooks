class Reservation < ActiveRecord::Base
  belongs_to :book

  validates :book_id, :loan_date, :due_date, presence: true
  after_save :update_book_availability

  def update_book_availability
    self.book.update_availability
  end
end
