class Incident < ApplicationRecord
  include WhatSequence
  belongs_to :booking
  belongs_to :user
  after_create :set_sequence

  def iva
    (self.total_cost + self.hourly_fee) * 0.21
  end
end
