class Category < ApplicationRecord
  mount_uploader :icon, IconUploader

  belongs_to :user

  has_many :entities, dependent: :destroy

  validates :name, presence: true

  def self.icons
    {
      housing: 'house.png',
      transportation: 'transport.png',
      food: 'food.png',
      education: 'education.png',
      health: 'health.png',
      utilities: 'utils.png',
      insurance: 'insurance.png',
      default: 'default.png'
    }
  end

end
