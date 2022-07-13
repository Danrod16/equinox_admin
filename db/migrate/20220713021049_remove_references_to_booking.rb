class RemoveReferencesToBooking < ActiveRecord::Migration[6.0]
  if foreign_key_exists?(:bookings, :users)
    remove_foreign_key :bookings, :users
  end
end
