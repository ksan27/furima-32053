FactoryBot.define do
  factory :item_purchase do
    postal_code    { '123-4567' }
    prefecture_id  { 2 }
    city           { '横浜市緑区' }
    house_number   { '青山1-1-1' }
    building_name  { 'ビル123' }
    phone_number   { '09012345678' }
    item_id        { 19 }
    user_id        { 2 }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
