class RemoveBookingRefFromLocations < ActiveRecord::Migration[7.0]
  def change
    remove_reference :locations, :booking, null: false, foreign_key: true
    add_reference :bookings, :location, null: false, foreign_key: true
    remove_reference :karts, :booking, null: false, foreign_key: true
    add_reference :bookings, :kart, null: false, foreign_key: true
  end
end
