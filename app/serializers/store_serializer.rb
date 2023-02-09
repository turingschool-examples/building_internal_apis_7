class StoreSerializer
  include JSONAPI::Serializer
  attributes :name, :num_books

  has_many :books
  
  attribute :active do
    true
  end
end