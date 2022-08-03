class Product < ApplicationRecord
  has_one_attached :photo

  # Validates
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
