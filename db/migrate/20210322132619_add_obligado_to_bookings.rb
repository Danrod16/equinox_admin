class AddObligadoToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :obligatory_complience, :integer
  end
end
