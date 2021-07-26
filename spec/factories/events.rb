FactoryBot.define do
  factory :event do
    user { nil }
    genre { nil }
    title { "MyString" }
    description { "MyText" }
    date { "2021-07-26" }
    time { "2021-07-26 22:06:25" }
    price { 1 }
    sold { false }
  end
end
