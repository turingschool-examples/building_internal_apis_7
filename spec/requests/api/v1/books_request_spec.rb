require 'rails_helper'

describe "Books API" do
  it "sends a list of books" do
    create_list(:book, 3)

    get '/api/v1/books'

    expect(response).to be_successful

    books = JSON.parse(response.body, symbolize_names: true)

    expect(books.count).to eq(3)

    books.each do |book|
      expect(book).to have_key(:id)
      expect(book[:id]).to be_an(Integer)

      expect(book).to have_key(:title)
      expect(book[:title]).to be_a(String)

      expect(book).to have_key(:author)
      expect(book[:author]).to be_a(String)

      expect(book).to have_key(:genre)
      expect(book[:genre]).to be_a(String)

      expect(book).to have_key(:summary)
      expect(book[:summary]).to be_a(String)

      expect(book).to have_key(:number_sold)
      expect(book[:number_sold]).to be_an(Integer)
    end
  end

  it "can get one book by its id" do
    id = create(:book).id
  
    get "/api/v1/books/#{id}"
  
    book = JSON.parse(response.body, symbolize_names: true)
  
    expect(response).to be_successful
  
    expect(book).to have_key(:id)
    expect(book[:id]).to eq(id)
  
    expect(book).to have_key(:title)
    expect(book[:title]).to be_a(String)
  
    expect(book).to have_key(:author)
    expect(book[:author]).to be_a(String)
  
    expect(book).to have_key(:genre)
    expect(book[:genre]).to be_a(String)
  
    expect(book).to have_key(:summary)
    expect(book[:summary]).to be_a(String)
  
    expect(book).to have_key(:number_sold)
    expect(book[:number_sold]).to be_an(Integer)
  end
end