class AddPagaToDeposits < ActiveRecord::Migration[6.0]
  def change
    add_column :deposits, :token_payment, :integer
  end
end
