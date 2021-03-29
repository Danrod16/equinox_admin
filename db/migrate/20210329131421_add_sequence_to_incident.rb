class AddSequenceToIncident < ActiveRecord::Migration[6.0]
  def change
    add_column :incidents, :sequence, :integer, default: 1
  end
end
