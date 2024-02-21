class RemoveItemsReferenceFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_reference :bookings, :items, null: false, foreign_key: true
  end
end
