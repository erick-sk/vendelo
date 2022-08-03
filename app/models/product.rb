class Product < ApplicationRecord
  # Validates
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
