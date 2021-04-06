require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'test factory' do
    let!(:user) { build(:user) }

    it 'is valid' do
      expect(user).to be_valid
    end
  end

  describe 'Test presence of columns' do
    test_cases = %i[email encrypted_password reset_password_token reset_password_sent_at remember_created_at]

    test_cases.each do |column|
      it { should have_db_column column }
    end
  end

  describe 'test associations' do
    it { should have_many(:pets).dependent(:destroy) }
  end
  
  describe 'Validations' do
    subject { User.new }
    
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email).case_insensitive }

    context 'test emails formats' do
      word1 = Faker::Lorem.word
      word2 = Faker::Lorem.word
      word3 = Faker::Lorem.word

      it { should allow_value("#{word1}@#{word2}.#{word3}").for(:email) }
      it { should_not allow_value("#{word1}.#{word2}").for(:email) }
      it { should_not allow_value(word1).for(:email) }
    end
  end
end
