class Product < ApplicationRecord
  belongs_to :seller,optional:true
  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true,numericality: { greater_than: 0, less_than: 10000 }
  validates :author, presence: true
  validates :description, presence: true
  validates :quantity, presence: true
end
