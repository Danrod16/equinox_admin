class Invoice < ApplicationRecord
  include WhatSequence
  belongs_to :booking
  after_create :set_sequence
  
  def rent_with_iva
    iva_subtotal = self.booking.rent - (self.booking.rent * 0.79)
    total_iva = self.booking.rent + iva_subtotal
  end

  def iva
    iva_subtotal = self.booking.rent - (self.booking.rent * 0.79)
  end

  def total
    rent_with_iva - self.booking.deposit.token_payment.to_f + self.fianza unless self.fianza.nil?
  end
end
