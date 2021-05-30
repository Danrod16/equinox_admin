class AddCompanyNameToLandlords < ActiveRecord::Migration[6.0]
  def change
    add_column :landlords, :company_name, :string
    remove_column :landlords, :street_2
  end
end
