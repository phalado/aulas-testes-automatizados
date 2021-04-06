require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe 'Test factory' do
    let!(:pet) { build(:pet, owner: create(:user)) }

    it 'is valid' do
      expect(pet).to be_valid
    end
  end

  describe 'test presence of columns' do
    test_cases = %i[name pet_type age user_id famous_reference]

    test_cases.each do |column|
      it { should have_db_column column }
    end
  end

  describe 'test associations' do
    it { should belong_to(:owner).class_name('User').with_foreign_key('user_id') }
  end

  describe 'validation' do
    test_cases = %i[name pet_type age]

    test_cases.each do |present_column|
      it { should validate_presence_of present_column }
    end
  end

  describe 'test enums' do
    let(:pet_types) { %i[dog cat mouse] }

    it { should define_enum_for(:pet_type).with_values(pet_types).backed_by_column_of_type(:integer) }
  end

  describe 'test callback' do
    subject { Pet.new }

    it { is_expected.to callback(:set_famous_reference).after(:save) }
  end

  describe 'test method' do
    test_cases = [['dog', 'Underdog'], ['cat', 'Frajola'], ['mouse', 'Mickey']]

    test_cases.each do |test_case|
      context 'create a pet and test it' do
        let!(:pet) { create(:pet, pet_type: test_case[0], owner: create(:user)) }
        
        it 'test cases' do
          expect(pet.pet_type).to eq(test_case[0])
          expect(pet.famous_reference).to eq(test_case[1])
        end
      end
    end
  end

  describe 'test scope' do
    let!(:cat) { create(:pet, pet_type: 'cat', owner: create(:user)) }
    let!(:dog) { create(:pet, pet_type: 'dog', owner: create(:user)) }
    let!(:mouse) { create(:pet, pet_type: 'mouse', owner: create(:user)) }

    it 'test presence of created pets inside cat scope' do
      expect(Pet.cats.count).to be(1)
      expect(Pet.cats.include?(cat)).to be_truthy
      expect(Pet.cats.include?(dog)).to be_falsy
      expect(Pet.cats.include?(mouse)).to be_falsy
    end
  end
end
