FactoryBot.define do
  factory :item do
    item_name        { '観葉植物' }
    explanation      { 'IKEA購入品' }
    price            { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id      { Faker::Number.between(from: 2, to: 11) }
    condition_id     { Faker::Number.between(from: 2, to: 7) }
    postage_id       { Faker::Number.between(from: 2, to: 3) }
    prefecture_id    { Faker::Number.between(from: 2, to: 48) }
    preparation_id   { Faker::Number.between(from: 2, to: 4) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
