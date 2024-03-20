class RemoveEmailAndPasswordFromSellers < ActiveRecord::Migration[7.1]
  def change
    remove_column :sellers, :email, :string
    remove_column :sellers, :password_digest, :string
  end
end
