class AddSuplidosToInvoices < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :supplements, :float
  end
end
