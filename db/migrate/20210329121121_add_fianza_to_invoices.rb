class AddFianzaToInvoices < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :fianza, :float
    add_column :invoices, :total, :float
  end
end
