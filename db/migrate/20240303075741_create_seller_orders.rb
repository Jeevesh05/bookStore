class CreateSellerOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :seller_orders do |t|
      t.references :seller, foreign_key: true
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
