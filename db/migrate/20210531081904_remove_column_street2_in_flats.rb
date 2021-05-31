class RemoveColumnStreet2InFlats < ActiveRecord::Migration[6.0]
  def change
    remove_column :flats, :street_2
    remove_column :flats, :access_terace
    add_column :flats, :habitability_number, :string
    add_column :flats, :catastral_number, :string
  end
end
