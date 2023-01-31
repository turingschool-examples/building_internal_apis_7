class Api::V2::BooksController < ApplicationController
  def index
    books = Book.all
    render json: BookSerializer.format_books(books)
  end
end