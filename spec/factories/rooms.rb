FactoryBot.define do
  factory :room do
    user
    name { Faker::Games::Pokemon.name }
    number { SecureRandom.hex(10) }
    private { [true, false].sample }
  end
end
