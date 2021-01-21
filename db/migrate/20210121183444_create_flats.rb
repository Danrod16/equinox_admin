class CreateFlats < ActiveRecord::Migration[6.0]
  def change
    create_table :flats do |t|
      t.text :address
      t.string :celula
      t.string :catastral
      t.integer :index
      t.string :cee
      t.integer :expenses
      t.string :insurance
      t.string :insurance_phone
      t.integer :keys
      t.boolean :access_terace
      t.integer :equinox_costs
      t.string :photos
      t.string :video
      t.boolean :furnished
      t.references :landlord, null: false, foreign_key: true

      t.timestamps
    end
  end
end
