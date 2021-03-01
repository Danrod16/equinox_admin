class Landlord < ApplicationRecord
  has_many :flats
  has_one_attached :photo
end
