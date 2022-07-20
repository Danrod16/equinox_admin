class RemoveExpiryFrominvoices < ActiveRecord::Migration[6.0]
  def change
    remove_column :invoices, :expiry_date if column_exists?(:invoices, :expiry_date)
  end
end
