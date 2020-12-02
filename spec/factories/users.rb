FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"aaa111"}
    password_confirmation {password}
    last_name             {"苗字"}
    first_name            {"名前"}
    last_name_kana        {"ミョウジ"}
    first_name_kana       {"ナマエ"}
    birth_day             {"1930-01-01"}
  end
end