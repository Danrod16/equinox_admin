class AddValidatedToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :validated, :boolean, default: false
  end
end
