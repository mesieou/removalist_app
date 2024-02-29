class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :pick_up_or_drop_off

      t.timestamps
    end
  end
end
