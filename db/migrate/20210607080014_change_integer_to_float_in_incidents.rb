class ChangeIntegerToFloatInIncidents < ActiveRecord::Migration[6.0]
  def change
    change_column :incidents, :total_cost, :float
  end
end
