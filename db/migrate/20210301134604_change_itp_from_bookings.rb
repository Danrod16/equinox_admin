class ChangeItpFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :itp
    remove_column :bookings, :appliencies
    add_column :bookings, :itp, :integer
    add_column :bookings, :appliences, :integer
  end
end
