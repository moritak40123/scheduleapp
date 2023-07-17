FactoryBot.define do
  factory :room do
    room_name {Faker::Team.name}
    description {Faker::Lorem.sentence}
  end
end
