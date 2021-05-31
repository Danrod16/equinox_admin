class Invoice < ApplicationRecord
  include WhatSequence
  belongs_to :booking
  after_create :set_sequence

  def rent_with_iva
    iva_subtotal = self.booking.rent - (self.booking.rent * 0.79)
    total_iva = self.booking.rent + iva_subtotal
    total_iva.round(2)
  end

  def iva
    iva_subtotal = self.booking.rent - (self.booking.rent * 0.79)
    iva_subtotal.round(2)
  end

  def total
    unless self.fianza.nil?
      total = rent_with_iva - self.booking.deposit.token_payment.to_f + self.fianza
      total.round(2)
    else
      total = rent_with_iva - self.booking.deposit.token_payment.to_f
      total.round(2)
    end
  end
end
