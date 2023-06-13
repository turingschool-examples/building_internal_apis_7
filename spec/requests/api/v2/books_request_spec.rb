require 'rails_helper'

describe "Books API" do
  it "sends a list of books" do
    create_list(:book, 3)

    get '/api/v2/books'

    expect(response).to be_successful

    books = JSON.parse(response.body, symbolize_names: true)
    
    expect(books[:data].count).to eq(3)

    books[:data].each do |book|
      expect(book).to have_key(:id)
      expect(book[:id]).to be_a(String)

      expect(book[:attributes]).to have_key(:title)
      expect(book[:attributes][:title]).to be_a(String)

      expect(book[:attributes]).to have_key(:author)
      expect(book[:attributes][:author]).to be_a(String)

      expect(book[:attributes]).to have_key(:genre)
      expect(book[:attributes][:genre]).to be_a(String)

      expect(book[:attributes]).to have_key(:summary)
      expect(book[:attributes][:summary]).to be_a(String)

      expect(book[:attributes]).to have_key(:number_sold)
      expect(book[:attributes][:number_sold]).to be_a(Integer)
    end
  end
end