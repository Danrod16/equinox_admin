class AddFlatReferenceToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :reference, :string
  end
end
