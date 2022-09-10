class Deal < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :user
  belongs_to :category

  validates :name, :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
