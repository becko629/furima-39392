FactoryBot.define do
  factory :address do
    post_code {'123-4567'}
    prefecture_id {'2'}
    city {'札幌市'}
    street_address {'1-1'}
    building_name {'Aビル'}
    phone_number {'08011112222'}
  end
end
