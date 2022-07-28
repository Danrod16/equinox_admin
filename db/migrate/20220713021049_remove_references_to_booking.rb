class RemoveReferencesToBooking < ActiveRecord::Migration[6.0]
  def change
    if foreign_key_exists?(:bookings, :users)
      remove_foreign_key :bookings, :users
    end
  end
end
