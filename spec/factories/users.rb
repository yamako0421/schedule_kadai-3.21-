FactoryBot.define do
  factory :user do
    title { "MyString" }
    start_date { "2024-03-10" }
    end_date { "2024-03-10" }
    is_all_day { false }
    memo { "MyText" }
  end
end
