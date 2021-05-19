class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :pet_type
      t.integer :age
      t.references :user, null: false, foreign_key: true
      t.string :famous_reference

      t.timestamps
    end
  end
end
