class AddNameToSellers < ActiveRecord::Migration[7.1]
  def change
    add_column :sellers, :name, :string
  end
end
