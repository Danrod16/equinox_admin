class RemoveUserFromIncidents < ActiveRecord::Migration[6.0]
  def change
    if foreign_key_exists?(:incidents, :users)
      remove_foreign_key :incidents, :users
    end
  end
end
