class AddCompanyToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :company, null: true, foreign_key: true
  end
end
