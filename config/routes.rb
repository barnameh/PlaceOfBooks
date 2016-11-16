Rails.application.routes.draw do
  # GET /books should show all books currently in the collection
  get 'books', controller: :books, action: :index

  # POST /books should create a new book in the collection
  get 'books/new', controller: :books, action: :new

  post 'books', controller: :books, action: :create

  # PATCH /books/:id allows editing of a book
  patch 'books/:id', controller: :books, action: :edit

  # GET /books/:id shows details for the current title
  get 'books/:id', controller: :books, action: :show

  # DELETE /books/:id destroys a book and all it's reservations
  delete 'books/:id', controller: :books, action: :destroy

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
