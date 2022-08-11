class Category < ApplicationRecord
  # Validates
  validates :name, presence: true

  # Associations
  has_many :products, dependent: :restrict_with_exception
end
