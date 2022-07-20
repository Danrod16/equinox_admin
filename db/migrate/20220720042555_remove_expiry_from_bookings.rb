class RemoveExpiryFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :expiry_date if column_exists?(:bookings, :expiry_date)
  end
end
