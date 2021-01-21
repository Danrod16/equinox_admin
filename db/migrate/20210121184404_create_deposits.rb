class CreateDeposits < ActiveRecord::Migration[6.0]
  def change
    create_table :deposits do |t|
      t.references :booking, null: false, foreign_key: true
      t.string :state
      t.integer :amount

      t.timestamps
    end
  end
end
