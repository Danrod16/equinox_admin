class AddAddressToTenants < ActiveRecord::Migration[6.0]
  def change
    add_column :tenants, :street, :string
    add_column :tenants, :street_2, :string
    add_column :tenants, :number, :string
    add_column :tenants, :postal_code, :string
    add_column :tenants, :city, :string
    add_column :tenants, :country, :string
  end
end
