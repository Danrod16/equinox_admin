class AddCurrencyToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :currency, :string, default: "EUR"
  end
end
