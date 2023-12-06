require 'rails_helper'

describe "Stores API" do
  describe "happy paths" do
   it "will return a store object in json, with no books" do
      create_list(:store, 5)

      get "/api/v1/stores/#{Store.first.id}"

      expect(response).to be_successful
      expect(response.status).to eq (200)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:data][:type]).to eq("store")
      expect(data[:data][:attributes][:num_books]).to eq(0)
   end

  end

  # Practice
  describe 'sad paths' do
    it "will gracefully handle if a Store id doesn't exist" do
      get "/api/v1/stores/123489846278"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      data = JSON.parse(response.body, symbolize_names: true)
      
      expect(data[:errors]).to be_a(Array)
      expect(data[:errors].first[:status]).to eq("404")
      expect(data[:errors].first[:title]).to eq("Couldn't find Store with 'id'=123489846278")
    end
  end
end