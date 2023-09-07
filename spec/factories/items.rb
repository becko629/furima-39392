FactoryBot.define do
  factory :item do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    category_id { Faker::Number.between(to: 11) }
    condition_id { Faker::Number.between(to: 7) }
    prefecture_id { Faker::Number.between(to: 48) }
    shipping_day_id { Faker::Number.between(to: 4) }
    shipping_charge_id { Faker::Number.between(to: 3) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    image { Faker::Lorem.sentence }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
