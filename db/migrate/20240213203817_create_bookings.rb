class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :date_time
      t.integer :duration_in_minutes
      t.integer :price
      t.string :status
      t.references :users, null: false, foreign_key: true
      t.references :locations, null: false, foreign_key: true
      t.references :services, null: false, foreign_key: true
      t.references :items, null: false, foreign_key: true

      t.timestamps
    end
  end
end
