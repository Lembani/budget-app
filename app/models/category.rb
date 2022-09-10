class Category < ApplicationRecord
  mount_uploader :icon, IconUploader

  belongs_to :user

  has_many :deals, dependent: :destroy

  validates :name, presence: true

end
