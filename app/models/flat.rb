class Flat < ApplicationRecord
  belongs_to :landlord
  has_many :bookings, dependent: :destroy
  has_many_attached :photos, dependent: :destroy
  validates :street, presence: true
  validates :city, presence: true
  validates :number, presence: true
  validates :postal_code, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_or_street,
    against: [ :name, :street],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def full_address
    "#{self.street}, #{self.number} #{self.postal_code}, #{self.city}, #{self.country}"
  end

  def table_attribute
    return self.name
  end
end
