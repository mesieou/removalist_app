class RemoveLocationsFromBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :karts do |t|
      t.references :booking, null: false, foreign_key: true
      t.timestamps
    end
    add_reference :items, :kart, null: false, foreign_key: true
    remove_reference :bookings, :location, null: false, foreign_key: true
    add_reference :locations, :booking, null: false, foreign_key: true
  end
end
