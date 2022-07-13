class AddUserReferencesToBooking < ActiveRecord::Migration[6.0]
  def up
    execute "ALTER TABLE bookings ADD CONSTRAINT fk_bookings_users FOREIGN KEY (user_id) REFERENCES public.users (id);"
    # execute "ALTER TABLE bookings ADD COLUMN user_id INTEGER REFERENCES public.users (id);"
  end
  # def change
    # add_reference :bookings, :user, null: false, foreign_key: true
  # end
end
