class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
