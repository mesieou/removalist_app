class RenameAddressInLocation < ActiveRecord::Migration[7.0]
  def change
    rename_column :locations, :address, :address_pick_up_1
  end
end
