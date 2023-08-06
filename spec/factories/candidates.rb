FactoryBot.define do
  factory :candidate do
    title      { Faker::Name.initials(number: 2) }
    start_time { Faker::Time.between(from: DateTime.now, to: DateTime.now + 1) }
    end_time   { Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 3) }
    association :user
    association :room
  end
end
