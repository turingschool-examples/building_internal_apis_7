20.times do
  Book.create!(
    title: Faker::Book.title,
    author: Faker::Book.author,
    genre: Faker::Book.genre,
    summary: Faker::Lorem.paragraph,
    number_sold: Faker::Number.within(range: 1..10)
  )
end

5.times do
  Store.create!(
    name: Faker::Company.name
  )
end

books = Book.all

books.each do |book|
  store_id_1 = rand(1..5)
  store_id_2 = rand(1..5)

  StoreBook.create!([
      {
        book_id: book.id,
        store_id: store_id_1,
        book_price: rand(100..10000),
        quantity: rand(1..10)
      },
      {
        book_id: book.id,
        store_id: store_id_2,
        book_price: rand(100..10000),
        quantity: rand(1..10)
      }
    ])
end