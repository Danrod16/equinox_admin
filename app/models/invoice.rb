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
    unless self.fianza.nil?
      rent_with_iva - self.booking.deposit.token_payment.to_f + self.fianza
    else
      rent_with_iva - self.booking.deposit.token_payment.to_f
    end
  end
end
