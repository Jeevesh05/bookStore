class Order < ApplicationRecord
	has_many :cart_items, dependent: :destroy
	has_many :products
  	belongs_to :user
  	has_many :order_items

end