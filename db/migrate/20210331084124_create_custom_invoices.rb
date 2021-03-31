class CreateCustomInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :custom_invoices do |t|
      t.string :client
      t.string :address
      t.string :nif
      t.string :title
      t.integer :sequence, default: 1
      t.integer :total_cost
      t.float :agency_fee
      t.text :description

      t.timestamps
    end
  end
end
