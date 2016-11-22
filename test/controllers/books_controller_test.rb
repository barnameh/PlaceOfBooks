require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get books_path
    assert_response :success
  end

  test "can show a form for a new book" do
    get new_book_path
    assert_response :success
  end

  test "can show specific book" do
    book = Book.create!(title: "Driven to Distraction",
                        description: "How to recognize and understand ADHD",
                        publication_date: Time.new(1995),
                        available: true)
    get book_path(id: book.id)
    assert_response :success
  end

  test "can show a form for editing a book" do
    book = Book.create!(title: "Driven to Distraction",
                        description: "How to recognize and understand ADHD",
                        publication_date: Time.new(1995),
                        available: true)
    get edit_book_path(id: book.id)
    assert_response :success
  end

  test "can create a book" do
    post books_path(book: { title: "Driven to Distraction",
                            description: "How to recognize and understand ADHD",
                            publication_date: Time.new(1995),
                            available: true })
    assert_response :redirect
    assert_equal "Driven to Distraction", Book.last.title
  end

  test "can update a book" do
    book = Book.create!(title: "Driven to Distraction",
                        description: "How to recognize and understand ADHD",
                        publication_date: Time.new(1995),
                        available: true)
    patch book_path(id: book.id,
                    book: { title: book.title,
                            description: "A popular book on ADHD",
                            publication_date: book.publication_date,
                            available: true })
    assert_response :redirect
    assert_equal "A popular book on ADHD", Book.find(book.id).description
  end

  test "can destroy a book" do
    book = Book.create!(title: "Driven to Distraction",
                        description: "How to recognize and understand ADHD",
                        publication_date: Time.new(1995),
                        available: true)
    delete book_path(id: book.id)
    assert_response :redirect
    assert_not Book.find_by(id: book.id)
  end
end
