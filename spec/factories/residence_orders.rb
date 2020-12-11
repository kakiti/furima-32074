FactoryBot.define do
  factory :residence_order do
    price         { Faker::Number.between(from: 300, to: 9_999_999) }
    token         { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '810-0801' }
    prefecture_id { 41 }
    city          { '福岡市博多区' }
    address       { '中洲４丁目6-12' }
    building      { 'プラート中洲 8階' }
    phone_number  { Faker::Number.between(from: 0o0000000000, to: 99_999_999_999) }
    user_id       { 1 }
    item_id       { 1 }
  end
end
