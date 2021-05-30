class AddPhoneToLandlords < ActiveRecord::Migration[6.0]
  def change
    add_column :landlords, :phone, :string
    add_column :landlords, :iban, :string
  end
end
