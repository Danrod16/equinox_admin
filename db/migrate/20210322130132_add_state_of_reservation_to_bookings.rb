class AddStateOfReservationToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :state, :string, default: "Abierta"
  end
end
