class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  belongs_to :tenant
  has_many :deposits
  has_many :receipts
  has_many :invoices
end
