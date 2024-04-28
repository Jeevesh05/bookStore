class Order < ApplicationRecord
	has_many :cart_items, dependent: :destroy
	has_many :products
  	belongs_to :user
  	has_many :order_items

  	enum status: [:pending, :shipped, :delivered]  # Define order statuses
  def update_status
    if (Time.now - created_at) < 1.days
      self.update(status: :pending)
    elsif (Time.now - created_at) < 3.days
      self.update(stauts: :shipped)
    elsif (Time.now - created_at) > 3.days
      self.update(status: :delivered)
    end
  end 
end