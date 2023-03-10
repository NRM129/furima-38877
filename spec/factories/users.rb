FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '桃子' }
    last_name             { '田中' }
    first_name_kana       { 'モモコ' }
    last_name_kana        { 'タナカ' }
    birthday              { '2000-01-01' }
  end
end
