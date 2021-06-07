class Flat < ApplicationRecord
  belongs_to :landlord
  has_many :bookings, dependent: :destroy
  has_many_attached :photos, dependent: :destroy

  def full_address
    "#{self.street}, #{self.number}, #{self.postal_code}, #{self.city}, #{self.country}"
  end
end
