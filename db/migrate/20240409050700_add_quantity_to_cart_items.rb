class AddQuantityToCartItems < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:cart_items, :quantity)
      add_column :cart_items, :quantity, :integer
    end
  end
end
