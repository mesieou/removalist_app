class CreateListOfItems < ActiveRecord::Migration[7.0]
  def change
    create_table :list_of_items do |t|
      t.string :name
      t.integer :estimated_total_loading_time

      t.timestamps
    end
  end
end
