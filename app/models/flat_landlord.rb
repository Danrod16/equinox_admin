class FlatLandlord < ApplicationRecord
  belongs_to :flat
  belongs_to :landlord
end
