require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create!(name: 'Jane', email: 'jane@mail.com', password: '123456', password_confirmation: '123456')
    @category = Category.new(name: 'Category 1', user_id: @user.id)
  end
  describe 'validations' do
    it 'is valid with valid attributes' do
      @category.save
      expect(@category).to be_valid
    end
    it 'is not valid without a name' do
      expect(Category.new).to_not be_valid
    end
  end

  describe 'associations' do
    it 'has many deals' do
      assc = described_class.reflect_on_association(:deals)
      expect(assc.macro).to eq :has_many
    end
    it 'belongs to users' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
