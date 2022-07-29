class CreateDocumentTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :document_templates do |t|
      t.string :title
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
