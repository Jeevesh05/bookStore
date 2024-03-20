class AddForeignKeyToCart < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :carts, :users
  end
end
