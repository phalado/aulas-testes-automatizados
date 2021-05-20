class Pet < ApplicationRecord
  belongs_to :owner, foreign_key: 'user_id', class_name: "User"

  validates_presence_of :name, :pet_type, :age
  enum pet_type: %i[dog cat mouse], _default: :cat

  after_save :set_famous_reference, if: :famous_reference_nil?

  scope :cats, -> { where(pet_type: 1) }

  def set_famous_reference
    famous = ''

    case pet_type
    when 'dog'
      famous = 'Underdog'
    when 'cat'
      famous = 'Frajola'
    when 'mouse'
      famous = 'Mickey'
    end

    self.update!(famous_reference: famous)
  end

  def famous_reference_nil?
    self.famous_reference.nil?
  end
end