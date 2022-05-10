class Landlord < ApplicationRecord
  has_many :flats, dependent: :destroy
  has_many :bookings, through: :flats
  has_one_attached :photo
  ID = ["Pasaporte", "DNI", "NIE", "Otro"]

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def full_address
    "#{self.street}, #{self.number} #{self.postal_code}, #{self.city}, #{self.country}"
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
end
