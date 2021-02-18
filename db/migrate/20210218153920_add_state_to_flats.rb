class AddStateToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :available, :boolean
  end
end
