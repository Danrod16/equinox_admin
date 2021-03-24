class AddNationalityToLandlords < ActiveRecord::Migration[6.0]
  def change
    add_column :landlords, :nationality, :string
  end
end
