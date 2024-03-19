class RemoveForeignKeyFromCart < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :carts, :users
  end
end
