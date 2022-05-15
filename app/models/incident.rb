class Incident < ApplicationRecord
  include WhatSequence
  belongs_to :booking
  belongs_to :user
  after_create :set_sequence
  INCIDENT_HEADERS = ["name", "city", "available"]
  include PgSearch::Model
  pg_search_scope :search_by_name_city_or_available,
    against: [ :name, :city, :available],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }



  def iva
    (self.total_cost + self.hourly_fee) * 0.21
  end
end
