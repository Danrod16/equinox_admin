class ChangeIntegerToFloatToDeposits < ActiveRecord::Migration[6.0]
  def change
    change_column :deposits, :token_payment, :float
  end
end
