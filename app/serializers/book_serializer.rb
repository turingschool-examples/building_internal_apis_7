class BookSerializer
  def self.format_books(books)
    books.map do |book|
      {
        id: book.id,
        title: book.title,
        author: book.author,
        genre: book.genre,
        summary: book.summary,
        popularity: book.popularity
      }
    end
  end
end