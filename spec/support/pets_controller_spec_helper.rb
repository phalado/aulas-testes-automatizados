module PetsControllerSpecHelper
  def pets_create_params(user_id)
    {
      name: Faker::Creature::Dog.name,
      pet_type: %i[dog cat mouse].sample,
      age: Faker::Number.number(digits: 1),
      user_id: user_id
    }
  end
end