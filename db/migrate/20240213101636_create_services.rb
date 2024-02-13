class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.integer :number_of_removalists
      t.boolean :packagin

      t.timestamps
    end
  end
end
