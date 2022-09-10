require 'rails_helper'

RSpec.describe Deal, type: :model do
  before(:each) do
    @user = User.create!(name: 'Jane', email: 'jane@mail.com', password: '123456', password_confirmation: '123456')
    @category = Category.create!(name: 'Category 1', user_id: @user.id)
    @deal = Deal.new(name: 'Deal 1', amount: 10, user_id: @user.id, category_id: @category.id)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      @deal.save
      expect(@deal).to be_valid
    end

    it 'is not valid without a name' do
      @deal.name = nil
      expect(@deal).to_not be_valid
    end
    it 'should initialize amount to 10' do
      @deal.save
      expect(@deal.amount).to eq(10)
    end
  end

  describe 'associations' do
    it 'belongs to users' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
    it 'belongs to categorys' do
      assc = described_class.reflect_on_association(:category)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
