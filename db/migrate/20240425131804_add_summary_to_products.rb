class AddSummaryToProducts < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:products, :summary)
      add_column :products, :summary, :text
    end
  end
end
