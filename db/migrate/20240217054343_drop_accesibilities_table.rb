class DropAccesibilitiesTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :accesibilities
  end
end
