class RemoveLandlordFromFlat < ActiveRecord::Migration[6.0]
  def change
    remove_column :flats, :landlord_id
  end
end
