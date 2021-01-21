class Flat < ApplicationRecord
  belongs_to :landlord
  has_many :bookings
end
