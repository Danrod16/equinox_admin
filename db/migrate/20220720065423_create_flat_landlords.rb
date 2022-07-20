class CreateFlatLandlords < ActiveRecord::Migration[6.0]
  def change
    create_table :flat_landlords do |t|
      t.references :flat, null: false, foreign_key: true
      t.references :landlord, null: false, foreign_key: true

      t.timestamps
    end
  end
end
