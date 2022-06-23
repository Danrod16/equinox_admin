class AddDefaultToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :language, :string, default: "en"
  end
end
