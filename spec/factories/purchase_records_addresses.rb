FactoryBot.define do
  factory :purchase_records_address do
    post_code { '123-4567' }
    prefecture_id { '2' }
    city { '札幌市' }
    street_address { '1-1' }
    building_name { '' }
    phone_number { '08011112222' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
