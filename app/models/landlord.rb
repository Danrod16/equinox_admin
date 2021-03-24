class Landlord < ApplicationRecord
  has_many :flats, dependent: :destroy
  has_one_attached :photo

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def full_address
    "#{self.street}, #{self.number}, #{street_present?} #{self.postal_code}, #{self.city}, #{self.country}"
  end

  def street_present?
    self.street_2.empty? ? "" : "#{self.street_2},"
  end
end
