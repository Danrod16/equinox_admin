class AddAddressToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :address, :string
  end
end
