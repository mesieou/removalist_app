class RemoveAddressesFromLocations < ActiveRecord::Migration[7.0]
  def change
    remove_column :locations, :addresses, :text
    remove_column :locations, :type_of_places, :text
    remove_column :locations, :number_of_stories, :text
    remove_column :locations, :stairs_or_lift, :text
    add_column :locations, :pick_up, :string
    add_column :locations, :drop_off, :string
    add_column :locations, :pick_up_type_of_place, :string
    add_column :locations, :drop_off_type_of_place, :string
    add_column :locations, :pick_up_number_of_stories, :string
    add_column :locations, :drop_off_number_of_stories, :string
    add_column :locations, :pick_up_stairs_or_lift, :string
    add_column :locations, :drop_off_stairs_or_lift, :string
  end
end
