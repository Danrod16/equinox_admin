class ChangeDatatypeOfItPfromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :appliences
    add_column :bookings, :appliences, :float
    remove_column :bookings, :agency_fee
    add_column :bookings, :agency_fee, :float
  end
end
