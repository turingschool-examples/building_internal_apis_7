class Book < ApplicationRecord
  before_save { |book| book.popularity = calculate_popularity }
  
  private
    def calculate_popularity
      if number_sold > 5
        'high'
      else
        'low'
      end
    end
  end