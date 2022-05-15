class Tenant < ApplicationRecord
  has_many :bookings
  has_one_attached :photo
  include PgSearch::Model
  pg_search_scope :search_by_first_name_and_last_name_and_address,
    against: [ :first_name, :last_name, :street ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def full_address
    "#{self.street}, #{self.number} #{self.postal_code}, #{self.city}, #{self.country}"
  end

  def table_attribute
    return self.full_name
  end
end
