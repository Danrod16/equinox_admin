class Landlord < ApplicationRecord
  has_many :flat_landlord
  has_many :flats, through: :flat_landlord, dependent: :destroy
  has_many :bookings, through: :flats
  has_one_attached :photo
  ID = ["Pasaporte", "DNI", "NIE", "Otro"]

  include PgSearch::Model
  pg_search_scope :search_by_first_name_and_last_name_and_address,
    against: [ :first_name, :last_name, :street, :company_name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def self.import(file)
    counter = 0
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      landlord = Landlord.assign_from_row(row)
      if landlord.save
        counter += 1
      else
        puts "#{landlord.first_name} #{landlord.last_name} - #{landlord.errors.full_messages.join(",")}"
      end
    end
    counter
  end

  def self.to_csv
    attributes = %w[id email first_name last_name notes id_number id_type cif street number postal_code city country nationality company_name phone iban]
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |landlord|
        csv << landlord.attributes.values_at(*attributes)
      end
    end
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def full_address
    "#{self.street}, #{self.number} #{self.postal_code}, #{self.city}, #{self.country}"
  end

  def table_attribute
    self.full_name
  end

  # ===============
  # = CSV support =
  # ===============
  comma do

    first_name
    last_name
    photo
    email
    notes
    id_number
    id_type
    cif
    street
    number
    postal_code
    country
    nationality
    company_name
    phone
    iban

  end

  private

  def self.assign_from_row(row)
    landlord = Landlord.where(email: row[:email]).first_or_initialize
    landlord.assign_attributes row.to_hash.slice(:first_name, :last_name, :notes, :id_number, :id_type, :cif, :street, :number, :postal_code, :city, :country, :nationality, :company_name, :phone, :iban)
    landlord
  end
end
