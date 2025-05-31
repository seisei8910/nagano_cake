class ChangePresensePriceOfItems < ActiveRecord::Migration[6.1]
  def change
    change_column :items, :price, :integer, null: false
  end
end
