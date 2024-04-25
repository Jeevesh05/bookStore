class AddColoumnToOrders < ActiveRecord::Migration[7.1]
  def change
    add_reference :orders, :user, foreign_key: true
    add_column :orders, :order_number, :string
    add_column :orders, :order_date, :datetime
  end
end
