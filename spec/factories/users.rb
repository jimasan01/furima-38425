FactoryBot.define do
  factory :user do
    person = Gimei.name
    
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {person.family.kanji}
    first_name            {person.first.kanji}
    family_name_kana      {person.family.katakana}
    first_name_kana       {person.first.katakana}
    birthday              {Faker::Date.birthday}
  end
end