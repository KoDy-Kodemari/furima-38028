FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {person.last.kanji}
    first_name            {person.first.kanji}
    last_name_reading     {person.last.katakana}
    first_name_reading    {person.first.katakana}
    date_of_birth         {Faker::Date.birthday}
  end
end