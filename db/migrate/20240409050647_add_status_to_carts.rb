class AddStatusToCarts < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:carts, :status)
     add_column :carts, :status, :string
    end
  end
end