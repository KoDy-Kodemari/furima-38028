FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              { "g9" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name_kanji       {person.last.kanji}
    first_name_kanji      {person.first.kanji}
    last_name_kana        {person.last.katakana}
    first_name_kana       {person.first.katakana}
    date_of_birth         {Faker::Date.birthday}
  end
end