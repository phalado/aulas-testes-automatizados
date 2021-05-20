FactoryBot.define do
  factory :pet do
    name { Faker::Creature::Dog.name }
    pet_type { %i[dog cat mouse].sample }
    age { Faker::Number.number(digits: 1) }

    trait :user do
      association :owner, factory: :user
    end
  end
end