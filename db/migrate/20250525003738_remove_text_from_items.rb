class RemoveTextFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :text, :integer
  end
end
