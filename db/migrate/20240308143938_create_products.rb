class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2
      t.string :author
      t.string :category
      t.text :description
      t.integer :quantity
      t.references :seller, foreign_key: true
      t.timestamps
    end
  end
end
