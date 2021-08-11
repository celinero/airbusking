FactoryBot.define do
  factory :review do
    user { nil }
    busker_profile { nil }
    comment { "MyText" }
    rating { 1 }
  end
end
