FactoryBot.define do
  factory :store do
    name { Faker::Commerce.vendor }
  end
end
