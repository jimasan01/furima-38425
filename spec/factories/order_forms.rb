FactoryBot.define do
  factory :order_form do
    user_id      { Faker::Number.non_zero_digit }
    item_id      { Faker::Number.non_zero_digit }
    postal_code  { '123-4567' }
    area_id      { 2 }
    city         { '東京都' }
    house_number { '1-1' }
    building     { '東京ハイツ' }
    tel_number   { '09012345678' }
  end
end
