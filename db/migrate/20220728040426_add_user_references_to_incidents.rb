class AddUserReferencesToIncidents < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE incidents ADD CONSTRAINT fk_incidents_users FOREIGN KEY (user_id) REFERENCES public.users (id);"
  end
end
