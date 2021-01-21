class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.references :booking, null: false, foreign_key: true
      t.string :state
      t.string :expiry_date

      t.timestamps
    end
  end
end
