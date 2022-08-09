class Product < ApplicationRecord
  # PG search
  include PgSearch::Model
  pg_search_scope :search_full_text, against: {
    title: 'A',
    description: 'B',
  }

  # Active storage
  has_one_attached :photo

  # Validates
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

  # Associations
  belongs_to :category
end
