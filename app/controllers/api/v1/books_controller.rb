class Api::V1::BooksController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
  
  def index
    render json: BookSerializer.new(Book.all)
  end

  def show
    render json: BookSerializer.new(Book.find(params[:id]))
  end

  def create
    new_book = Book.create(book_params)
    render json: BookSerializer.new(new_book)
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    render json: BookSerializer.new(book)
  end
  
  def destroy # This method uses begin/rescue code to illustrate what `rescue_from` is doing at the top of the file. If you're using `rescue_from`, this code would not be necessary; it's here just for demo purposes!
    begin
      book = Book.find(params[:id])
      book.destroy
      render json: BookSerializer.new(book)
    rescue ActiveRecord::RecordNotFound => error
      render json: ErrorSerializer.new(ErrorMessage.new(error.message, 404)).serialize_json, status: 404
    end

  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :summary, :genre, :number_sold)
  end

  def not_found_response
    render json: ErrorSerializer.new(ErrorMessage.new(error.message, 404)).serialize_json, status: 404
  end
end