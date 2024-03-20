class AddForeignKeyToOrders < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :orders, :users
  end
end
