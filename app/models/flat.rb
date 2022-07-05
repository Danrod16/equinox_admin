class Flat < ApplicationRecord
  belongs_to :landlord
  has_many :bookings, dependent: :destroy
  has_many_attached :photos, dependent: :destroy
  validates :street, presence: true
  validates :city, presence: true
  validates :number, presence: true
  validates :postal_code, presence: true

  before_save :create_address

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_or_street,
    against: [ :name, :street],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def self.import(file)
    counter = 0
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      flat = Flat.assign_from_row(row)
      if flat.save
        counter += 1
      else
        puts "#{flat.name} - #{flat.errors.full_messages.join(",")}"
      end
    end
    counter
  end

  def self.to_csv
    attributes = %w[id celula catastral index cee expenses insurance insurance_phone keys equinox_costs furnished landlord_id available name reference street number postal_code city country letter_box reference_rent habitability_number latitude longitude address]
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |flat|
        csv << flat.attributes.values_at(*attributes)
      end
    end
  end

  def full_address
    "#{self.street} #{self.number}, #{self.postal_code}, #{self.city}, #{self.country}"
  end

  def map_address
     "#{self.street.gsub(/\d.+/, "").strip} #{self.number}, #{self.postal_code}, #{self.city}, #{self.country}"
  end

  def table_attribute
    return self.name
  end

  def create_address
    self.address = self.map_address
  end

  def furnished?
    self.furnished
  end

  def available?
    self.available
  end

  private

  def self.assign_from_row(row)
    flat = Flat.where(name: row[:name]).first_or_initialize
    flat.assign_attributes row.to_hash.slice(:celula, :catastral, :index, :cee, :expenses, :insurance, :insurance_phone, :keys, :equinox_costs, :furnished, :landlord_id, :available, :name, :reference, :street, :number, :postal_code, :city, :country, :letter_box, :reference_rent, :habitability_number, :latitude, :longitude, :address)
    flat
  end
end
