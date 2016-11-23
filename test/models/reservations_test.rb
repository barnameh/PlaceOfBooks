require "test_helper"

class ReservationTest < ActiveSupport::TestCase
  test "can create a reservations" do
    book = Book.create!(title: "Driven to Distraction",
                        description: "How to recognize and understand ADHD",
                        publication_date: Date.new(1995),
                        available: true)
    book_reservation = Reservation.new(book_id: book.id,
                                       loan_date: Date.today,
                                       due_date: Date.today.next_month)
    assert book_reservation.save
  end

  test "reservations must be related to a book" do
    book_reservation = Reservation.new(loan_date: Date.today,
                                       due_date: Date.today.next_month)
    assert_not book_reservation.save
  end

  test "reservations must have a loan date" do
    book = Book.create!(title: "Driven to Distraction",
                        description: "How to recognize and understand ADHD",
                        publication_date: Date.new(1995),
                        available: true)
    book_reservation = Reservation.new(book_id: book.id,
                                       due_date: Date.today.next_month)
    assert_not book_reservation.save
  end

  test "reservations must have a due date" do
    book = Book.create!(title: "Driven to Distraction",
                        description: "How to recognize and understand ADHD",
                        publication_date: Date.new(1995),
                        available: true)
    book_reservation = Reservation.new(book_id: book.id,
                                       loan_date: Date.today)
    assert_not book_reservation.save
  end

  test "can update a reservation" do
    book = Book.create!(title: "Driven to Distraction",
                        description: "How to recognize and understand ADHD",
                        publication_date: Date.new(1995),
                        available: true)
    book_reservation = Reservation.create!(book_id: book.id,
                                           loan_date: Date.today,
                                           due_date: Date.today.next_month)
    assert book_reservation.update(due_date: book_reservation.due_date.next_month)
  end
end
