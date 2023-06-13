class Api::V2::BooksController < ApplicationController
  def index
    books = Book.all
    render json: BookSerializer.new(books)
  end
end