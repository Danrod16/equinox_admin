class Landlord < ApplicationRecord
  has_many :flats, dependent: :destroy
  has_many :bookings, through: :flats
  has_one_attached :photo

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def full_address
    "#{self.street}, #{self.number} #{self.postal_code}, #{self.city}, #{self.country}"
  end
end
