class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :type
      t.integer :number_of_stories
      t.boolean :stairs_or_lift

      t.timestamps
    end
  end
end
