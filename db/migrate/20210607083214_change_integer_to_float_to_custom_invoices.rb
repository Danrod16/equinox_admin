class ChangeIntegerToFloatToCustomInvoices < ActiveRecord::Migration[6.0]
  def change
    change_column :custom_invoices, :total_cost, :float
  end
end
