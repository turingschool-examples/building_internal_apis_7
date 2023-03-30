require 'rails_helper'

describe "Books API" do
  it "sends a list of books" do
    create_list(:book, 3)

    get '/api/v2/books'

    expect(response).to be_successful
    
    books = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(books.count).to eq(3)

    books.each do |book|
      expect(book).to have_key(:id)
      expect(book[:id]).to be_an(Integer)

      expect(book[:attributes]).to have_key(:title)
      expect(book[:attributes][:title]).to be_a(String)

      expect(book[:attributes]).to have_key(:author)
      expect(book[:attributes][:author]).to be_a(String)

      expect(book[:attributes]).to have_key(:genre)
      expect(book[:attributes][:genre]).to be_a(String)

      expect(book[:attributes]).to have_key(:summary)
      expect(book[:attributes][:summary]).to be_a(String)

      expect(book[:attributes]).to have_key(:popularity)
      expect(book[:attributes][:popularity]).to be_an(String)

      expect(book[:attributes]).to_not have_key(:number_sold)
    end
  end
end