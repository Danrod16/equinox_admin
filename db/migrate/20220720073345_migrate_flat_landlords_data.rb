class MigrateFlatLandlordsData < ActiveRecord::Migration[6.0]
  def up
    ActiveRecord::Base.connection.execute("INSERT INTO flat_landlords(flat_id, landlord_id, created_at, updated_at) SELECT id, landlord_id, created_at, updated_at from flats")
  end
end
