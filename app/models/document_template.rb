class DocumentTemplate < ApplicationRecord
  belongs_to :company
  has_rich_text :rich_body

end
