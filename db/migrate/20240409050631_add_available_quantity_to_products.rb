class AddAvailableQuantityToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :available_quantity, :integer
  end
end
