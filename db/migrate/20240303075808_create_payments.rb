class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.references :order, foreign_key: true
      t.string :payment_method
      t.decimal :amount, precision: 10, scale: 2
      t.string :status
      t.timestamps
    end
  end
end
