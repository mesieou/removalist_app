class RemoveForeignKeyFromLocations < ActiveRecord::Migration[7.0]
  def change
    remove_reference :locations, :accesibility, foreign_key: true
  end
end
