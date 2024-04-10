class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy

  scope :active, -> { where(status: 'active') }

  def add_item(product, quantity)
    cart_item = cart_items.find_by(product_id: product.id)
    if cart_item
      cart_item.update(quantity: cart_item.quantity + quantity)
    else
      cart_items.create(product: product, quantity: quantity)
    end
  end

  def total_amount
    cart_items.sum { |item| (item.product.price || BigDecimal('0')) * (item.quantity || 0) }
  end

end
