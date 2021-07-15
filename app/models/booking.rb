class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  belongs_to :tenant
  has_one :settlement, dependent: :destroy
  has_one :deposit, dependent: :destroy
  accepts_nested_attributes_for :deposit
  has_many :receipts, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :incidents, dependent: :destroy
  after_create :create_invoice, :contract_length
  before_update :contract_length, if: :booking_date_changed?
  after_create :strip_date

  def create_invoice
    Invoice.create(booking_id: self.id, state: self.state)
    Receipt.create(booking_id: self.id)
  end

  def update_invoice
    Invoice.update(booking_id: self.id, state: self.state)
  end

  def contract_length
    number_of_payments = (self.end_date.to_date - self.start_date.to_date).to_i / 30
    self.update_column(:payments, number_of_payments)
  end

  private

  def booking_date_changed?
    self.start_date_changed? || self.end_date_changed?
  end

  def strip_date
    self.update(start_date: self.start_date.split(" ")[0], end_date: self.end_date.split(" ")[0])
  end
end
