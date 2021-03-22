class AddFeeToIncidents < ActiveRecord::Migration[6.0]
  def change
    add_column :incidents, :hourly_fee, :float
  end
end
