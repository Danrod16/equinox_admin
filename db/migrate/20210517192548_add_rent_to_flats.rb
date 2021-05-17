class AddRentToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :reference_rent, :integer
  end
end
