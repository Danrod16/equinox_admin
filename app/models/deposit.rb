class Deposit < ApplicationRecord
  belongs_to :booking
  validates :amount, :state, :token_payment, presence: true

  def table_attribute
    return self.amount
  end
end
