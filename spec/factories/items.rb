FactoryBot.define do
  factory :item do
    name                   {"test"}
    explanation            {"説明です"}
    category_id            {"2"}
    status_id              {"2"}
    shipping_fee_id        {"2"}
    shipping_prefecture_id {"2"}
    shipping_day_id        {"2"}
    price                  {"300"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png')
    end
  end
end
