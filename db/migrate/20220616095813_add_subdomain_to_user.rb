class AddSubdomainToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :subdomain, :string
    add_column :users, :company_name, :string
  end
end
