class Tenant < ApplicationRecord
  has_many :bookings
  has_one_attached :photo

  def full_name
  end
end
