FactoryBot.define do
  factory :room do
    user { nil }
    name { "MyString" }
    number { "MyString" }
    private { false }
  end
end
