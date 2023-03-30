FactoryBot.define do
  factory :room_user do
    user
    room
    host { true }
    active { true }
  end
end
