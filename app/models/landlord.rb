class Landlord < ApplicationRecord
  has_many :flats, dependent: :destroy
  has_one_attached :photo
end
