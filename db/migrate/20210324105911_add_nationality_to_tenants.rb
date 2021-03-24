class AddNationalityToTenants < ActiveRecord::Migration[6.0]
  def change
    add_column :tenants, :nationality, :string
  end
end
