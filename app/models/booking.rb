class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  belongs_to :tenant
  has_one :settlement, dependent: :destroy
  has_one :deposit, dependent: :destroy
  accepts_nested_attributes_for :deposit, update_only: true

  has_many :receipts, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :incidents, dependent: :destroy
  after_create :create_invoice, :contract_length
  before_update :contract_length, if: :booking_date_changed?
  after_create :strip_date
  before_save :async_update_status, if: :will_save_change_to_end_date?
  # after_commit :async_update_status

  CONTRACT_TYPE = ['Largo Plazo', 'Temporal', 'Otro']
  TABLE_HEADERS = ["user", "flat", "tenant", "deposit", "state"]
  COLORS = ['#7BDFF2', '#B2F7EF', '#EFF7F6', '#F7D6E0', '#F2B5D4']

  validates :start_date, :end_date, presence: true

  def create_invoice
    Invoice.create(booking_id: id, state: state)
    Receipt.create(booking_id: id)
  end

  def update_invoice
    Invoice.update(booking_id: id, state: state)
  end

  def contract_length
    number_of_payments = (end_date.to_date - start_date.to_date).to_i / 30
    update_column(:payments, number_of_payments)
  end

  def table_attribute
    id
  end

  private

  def booking_date_changed?
    puts start_date_changed? || end_date_changed?
    start_date_changed? || end_date_changed?
  end

  def strip_date
    update(start_date: start_date.split[0], end_date: end_date.split[0])
  end

  def async_update_status
    puts "================================================================================================================================================"
    if self.end_date.to_date.noon <= Date.today
      self.state = 'Cerrada'
    else
      self.state = 'Abierta' if self.state == 'Cerrada'
      UpdateBookingJob.set(wait_until: self.end_date.to_date.noon).perform_later(self.user.id, self.id)
    end
  end
end
