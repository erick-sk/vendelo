class Category < ApplicationRecord
  # Associations
  has_many :products, dependent: :restrict_with_exception
end
