FactoryBot.define do
  factory :item do
    title         {Faker::Name.initials(number: 2)}
    concept       {Faker::Lorem.sentence}
    category_id   {Faker::Number.between(from: 2,to: 10)}
    status_id     {Faker::Number.between(from: 2,to: 7)}
    fee_id        {Faker::Number.between(from: 2,to: 3)}
    prefecture_id {Faker::Number.between(from: 2,to: 48)}
    schedule_id   {Faker::Number.between(from: 2,to: 4)}
    price         {Faker::Number.between(from: 300,to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
