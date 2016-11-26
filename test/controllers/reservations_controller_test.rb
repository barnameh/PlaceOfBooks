require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reservations_path
    assert_response :success
  end

  test "should get reservations for a book" do
    book = Book.create!(title: "Driven to Distraction",
                        description: "How to recognize and understand ADHD",
                        publication_date: Date.new(1995),
                        available: true)
    Reservation.create!(book_id: book.id,
                        loan_date: Time.new(2016, 9, 15),
                        due_date: Time.new(2016, 10, 15),
                        return_date: Time.new(2016, 9, 30))
    Reservation.create!(book_id: book.id,
                        loan_date: Date.today,
                        due_date: Date.today.next_month)

    get book_reservations_path(book.id)
    assert_response :success
  end

  test "can show a form for a new book reservation" do
    book = Book.create!(title: "Driven to Distraction",
                        description: "How to recognize and understand ADHD",
                        publication_date: Date.new(1995),
                        available: true)

    get new_book_reservation_path(book.id)
    assert_response :success
  end

  test "can show specific reservation" do
    book = Book.create!(title: "Driven to Distraction",
                        description: "How to recognize and understand ADHD",
                        publication_date: Time.new(1995),
                        available: true)
    book_reservation = Reservation.create!(book_id: book.id,
                                           loan_date: Date.today,
                                           due_date: Date.today.next_month)
    get reservation_path(book_reservation.id)
    assert_response :success
  end

  test "can show a form for editing a book reservation" do
    book = Book.create!(title: "Driven to Distraction",
                        description: "How to recognize and understand ADHD",
                        publication_date: Time.new(1995),
                        available: true)
    book_reservation = Reservation.create!(book_id: book.id,
                                           loan_date: Date.today,
                                           due_date: Date.today.next_month)
    get edit_reservation_path(id: book.id)
    assert_response :success
  end

  test "can create a book reservation" do
    book = Book.create!(title: "Driven to Distraction",
                        description: "How to recognize and understand ADHD",
                        publication_date: Time.new(1995),
                        available: true)

    post reservations_path(reservation: { book_id: book.id,
                                          loan_date: Date.today,
                                          due_date: Date.today.next_month })
    assert_response :redirect
    assert_equal "Driven to Distraction", Reservation.last.book.title
  end

  test "can update a book reservation" do
    book = Book.create!(title: "Driven to Distraction",
                        description: "How to recognize and understand ADHD",
                        publication_date: Time.new(1995),
                        available: true)
    book_reservation = Reservation.create!(book_id: book.id,
                                           loan_date: Time.new(2016, 9, 15),
                                           due_date: Time.new(2016, 10, 15))
    patch reservation_path(id: book_reservation.id,
                           reservation: { book_id: book.id,
                                          loan_date: Time.new(2016, 9, 15),
                                          due_date: Time.new(2016, 10, 15),
                                          return_date: Time.new(2016, 10, 1) })
    assert_response :redirect
    assert_equal Time.new(2016, 10, 1), Reservation.find(book_reservation.id).return_date
  end

  test "can extend due date of a book reservation" do
    book = Book.create!(title: "Driven to Distraction",
                        description: "How to recognize and understand ADHD",
                        publication_date: Time.new(1995),
                        available: true)
    book_reservation = Reservation.create!(book_id: book.id,
                                           loan_date: Time.new(2016, 9, 15),
                                           due_date: Time.new(2016, 10, 15))
    patch reservation_path(id: book_reservation.id, due_date: Date.today.next_month)
    assert_response :redirect
    assert_equal Date.today.next_month, Reservation.find(book_reservation.id).due_date
  end

  test "can set the return date of a book reservation" do
    book = Book.create!(title: "Driven to Distraction",
                        description: "How to recognize and understand ADHD",
                        publication_date: Time.new(1995),
                        available: true)
    book_reservation = Reservation.create!(book_id: book.id,
                                           loan_date: Time.new(2016, 9, 15),
                                           due_date: Time.new(2016, 10, 15))
    patch reservation_path(id: book_reservation.id, return_date: Date.today)
    assert_response :redirect
    assert_equal Date.today, Reservation.find(book_reservation.id).return_date
  end
end
