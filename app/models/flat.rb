class Flat < ApplicationRecord
  belongs_to :landlord
  has_many :bookings, dependent: :destroy
  has_many_attached :photos, dependent: :destroy
end
