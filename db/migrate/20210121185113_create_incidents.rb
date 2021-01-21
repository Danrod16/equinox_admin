class CreateIncidents < ActiveRecord::Migration[6.0]
  def change
    create_table :incidents do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :state
      t.string :title
      t.text :description
      t.string :photo
      t.text :rules
      t.integer :total_cost
      t.text :notes

      t.timestamps
    end
  end
end
