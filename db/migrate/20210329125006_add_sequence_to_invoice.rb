class AddSequenceToInvoice < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :sequence, :integer, default: 1
  end
end
