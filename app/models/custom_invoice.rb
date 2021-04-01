class CustomInvoice < ApplicationRecord
  include WhatSequence
  after_create :set_sequence

  def iva
    (self.total_cost + self.agency_fee) * 0.21
  end
end
