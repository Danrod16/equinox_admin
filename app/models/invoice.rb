class Invoice < ApplicationRecord
  include WhatSequence
  belongs_to :booking
  after_create :set_sequence

  INVOICE_HEADERS = [ "sequence", "booking", "state", "expirry_date", "total"]

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
      total = rent_with_iva - self.booking.deposit.token_payment.to_f + suplidos
      total.round(2)
  end

  def suplidos
    if self.fianza.nil? && self.supplements.nil?
      suplidos = 0
    elsif self.fianza.nil?
      suplidos = self.supplements
    elsif self.supplements.nil?
      suplidos = self.fianza
    else
      suplidos = self.fianza + self.supplements
    end
  end
end
