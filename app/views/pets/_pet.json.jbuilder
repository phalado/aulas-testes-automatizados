json.extract! pet, :id, :name, :pet_type, :age, :user_id, :famous_reference, :created_at, :updated_at
json.url pet_url(pet, format: :json)
