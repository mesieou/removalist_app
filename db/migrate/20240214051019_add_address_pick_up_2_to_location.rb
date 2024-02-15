class AddAddressPickUp2ToLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :address_pick_up_2, :string
    add_column :locations, :address_drop_off, :string
  end
end
