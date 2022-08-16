class Product < ApplicationRecord
  # PG search
  include PgSearch::Model
  pg_search_scope :search_full_text, against: {
    title: 'A',
    description: 'B',
  }

  # Variables
  ORDER_BY = {
    newest: "created_at DESC",
    expensive: "price DESC",
    cheapest: "price ASC"
  }

  # Active storage
  has_one_attached :photo

  # Validates
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

  # Associations
  belongs_to :category
  belongs_to :user, default: -> { Current.user }

  def owner?
    user_id == Current.user.id
  end
end
