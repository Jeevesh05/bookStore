class RemoveColumnFromOrder < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :order_number, :string
    remove_column :orders, :order_date, :datetime
    remove_column :orders, :status, :string
  end
end
