class BookSerializer
  include JSONAPI::Serializer
  attributes :title, :author, :genre, :summary, :number_sold

  def self.format_books(books)
    {
      data: books.map do |book|
        {
          id: book.id,
          attributes: {
            title: book.title,
            author: book.author,
            genre: book.genre,
            summary: book.summary,
            popularity: book.popularity
          }
        }
      end
    }
  end
end
