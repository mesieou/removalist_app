class RemoveQuantityFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :quantity
  end
end
