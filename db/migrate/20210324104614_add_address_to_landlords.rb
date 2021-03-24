class AddAddressToLandlords < ActiveRecord::Migration[6.0]
  def change
    add_column :landlords, :street, :string
    add_column :landlords, :street_2, :string
    add_column :landlords, :number, :string
    add_column :landlords, :postal_code, :string
    add_column :landlords, :city, :string
    add_column :landlords, :country, :string
    add_column :flats, :street, :string
    add_column :flats, :street_2, :string
    add_column :flats, :number, :string
    add_column :flats, :postal_code, :string
    add_column :flats, :city, :string
    add_column :flats, :country, :string
    remove_column :flats, :address
  end
end
