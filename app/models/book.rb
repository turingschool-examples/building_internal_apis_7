class Book < ApplicationRecord
  before_save { |book| book.popularity = calculate_popularity }
  
  has_many :store_books
  has_many :stores, through: :store_books
  
  private

  def calculate_popularity
    if number_sold > 5
      'high'
    else
      'low'
    end
  end
end