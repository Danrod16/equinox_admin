class RemoveFlatRules < ActiveRecord::Migration[6.0]
  def change
    remove_column :incidents, :rules
    add_column :incidents, :total_hours, :integer
  end
end
