class AddKeyPostToFlats < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :letter_box, :boolean
  end
end
