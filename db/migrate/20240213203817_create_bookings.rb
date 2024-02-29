class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.integer :duration_in_minutes
      t.integer :price
      t.string :status

      t.timestamps
    end
  end
end
