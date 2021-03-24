class Flat < ApplicationRecord
  belongs_to :landlord
  has_many :bookings, dependent: :destroy
  has_many_attached :photos, dependent: :destroy

  def full_address
    "#{self.street}, #{self.number}, #{street_present?} #{self.postal_code}, #{self.city}, #{self.country}"
  end

  def street_present?
    self.street_2.empty? ? "" : "#{self.street_2},"
  end
end
