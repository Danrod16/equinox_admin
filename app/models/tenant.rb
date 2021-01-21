class Tenant < ApplicationRecord
  has_many :bookings
end
