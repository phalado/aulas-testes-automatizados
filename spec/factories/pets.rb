FactoryBot.define do
  factory :pet do
    name { "MyString" }
    pet_type { 1 }
    age { 1 }
    user { nil }
    famous_reference { "MyString" }
  end
end
