class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  belongs_to :tenant
  has_one :deposit, dependent: :destroy
  accepts_nested_attributes_for :deposit
  has_many :receipts, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :incidents, dependent: :destroy
  # after_create :create_invoice
  after_update :update_invoice

  def create_invoice
    # Invoice.create(booking_id: self.id, state: self.state, expirry_date: self.expiry_date)
    Receipt.create(booking_id: self.id)
  end

  def update_invoice
    Invoice.update(booking_id: self.id, state: self.state, expirry_date: self.expiry_date)
  end

  def contract_length
    self.end_date.to_date - self.start_date.to_date
  end
end
