FactoryBot.define do
  factory :order_payment do
    post_code       { '123-4567' }
    prefecture_id   { Faker::Number.between(from: 2, to: 48) }
    city            { '東京都' }
    address         { '1-1' }
    phone_number    { '0123456789' }
  end
end

