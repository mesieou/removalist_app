class RemoveLocationsReferenceFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_reference :bookings, :locations, index: true, foreign_key: true
  end
end
