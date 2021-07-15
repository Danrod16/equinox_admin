class ChangeDatatypeOfItPfromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :itp
    add_column :bookings, :itp, :float
  end
end
