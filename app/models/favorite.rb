class Favorite < ApplicationRecord
  # Validations
  validates :user, uniqueness: { scope: :product }

  # Associations
  belongs_to :user
  belongs_to :product
end
