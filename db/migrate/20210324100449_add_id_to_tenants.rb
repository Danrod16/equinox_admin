class AddIdToTenants < ActiveRecord::Migration[6.0]
  def change
    add_column :tenants, :id_number, :string
    add_column :tenants, :id_type, :string
    add_column :tenants, :cif, :string
    add_column :landlords, :id_number, :string
    add_column :landlords, :id_type, :string
    add_column :landlords, :cif, :string
    remove_column :tenants, :dni, :string
    remove_column :landlords, :dni, :string
  end
end
