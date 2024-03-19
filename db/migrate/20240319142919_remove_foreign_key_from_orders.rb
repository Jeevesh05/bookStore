class RemoveForeignKeyFromOrders < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :orders, :users
  end
end
