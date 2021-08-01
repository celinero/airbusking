FactoryBot.define do
  factory :order do
    event { nil }
    buyer { nil }
    seller { nil }
    receipt_url { "MyString" }
    payment_id { "MyString" }
  end
end
