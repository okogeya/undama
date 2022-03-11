FactoryBot.define do
  factory :event do
    title {Faker::Lorem.sentence}
    text {Faker::Lorem.sentence}
    day {Faker::Date.in_date_period}
    happy_level_id {Faker::Number.within(range: 2..4)}
    public_id {Faker::Number.within(range: 2..3)}
    association :user 
  end
end
