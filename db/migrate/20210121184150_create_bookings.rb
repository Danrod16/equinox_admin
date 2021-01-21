class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :start_date
      t.string :end_date
      t.string :deposit_registry
      t.boolean :deposit_paid
      t.string :contract_type
      t.integer :deposit_amount
      t.integer :rent
      t.string :appliencies
      t.string :itp
      t.integer :agency_fee
      t.integer :payments
      t.string :expiry_date
      t.text :check_in_notes
      t.references :flat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :tenant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
