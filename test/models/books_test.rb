require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "can create a book" do
    book = Book.new(title: "Driven to Distraction",
                    description: "How to recognize and understand ADHD",
                    publication_date: Time.new(1995),
                    available: true)
    assert book.save
  end

  test "book must have a title" do
    book = Book.new(description: "How to recognize and understand ADHD",
                    publication_date: Time.new(1995),
                    available: true)
    assert_not book.save
  end

  test "can update a book" do
    book = Book.create!(title: "Driven to Distraction",
                        description: "How to recognize and understand ADHD",
                        publication_date: Time.new(1995),
                        available: true)
    assert book.update(available: false)
  end

  test "can delete a book" do
    book = Book.create!(title: "Driven to Distraction",
                        description: "How to recognize and understand ADHD",
                        publication_date: Time.new(1995),
                        available: true)
    assert Book.find(book.id).destroy
    assert_not Book.find_by(id: book.id)
  end

end
