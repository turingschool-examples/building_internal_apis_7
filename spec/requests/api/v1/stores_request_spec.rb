require 'rails_helper'

describe "Stores index Endpoint" do
  it "sends a list of stores" do
    create_list(:store, 3)

    get '/api/v1/stores'

    expect(response).to be_successful

    stores = JSON.parse(response.body, symbolize_names: true)

    expect(stores.count).to eq(3)

    stores.each do |store|
      expect(store).to have_key(:id)
      expect(store[:id]).to be_an(Integer)

      expect(store).to have_key(:name)
      expect(store[:name]).to be_a(String)
    end
  end

  it "can get one store by its id" do
    id = create(:store).id
  
    get "/api/v1/stores/#{id}"
  
    store = JSON.parse(response.body, symbolize_names: true)
  
    expect(response).to be_successful
  
    expect(store).to have_key(:id)
    expect(store[:id]).to eq(id)
  
  end
end
