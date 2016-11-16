class BooksController < ApplicationController
  def index
    @books = Book.all
    render :index
  end

  def new
    @book = Book.new
    render :new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to "/books"
    else
      render :new
    end
  end

  def book_params
    params.require(:book).permit(:title, :description, :publication_date, :available)
  end

  def edit
  end

  def destroy
    #book.find(params.require(:book).permit[:id]).destroy
    #rediredt_to "/books"
    render destroy
  end
end
