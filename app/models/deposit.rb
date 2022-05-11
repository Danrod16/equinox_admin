class Deposit < ApplicationRecord
  belongs_to :booking

  def table_attribute
    return self.amount
  end
end
