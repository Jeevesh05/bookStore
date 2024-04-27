class Product < ApplicationRecord
  belongs_to :seller

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  has_many :product_categories
  has_many :categories, through: :product_categories

  validates :name, presence: true
  validates :price, presence: true,numericality: { greater_than: 0, less_than: 10000 }
  validates :author, presence: true
  validates :description, presence: true
  validates :quantity, presence: true
  validates :summary, presence: true
end
