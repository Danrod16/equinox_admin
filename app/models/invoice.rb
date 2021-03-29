class Invoice < ApplicationRecord
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

  def set_sequence
    @array = []
    Invoice.all.each do |invoice|
      @array << invoice.sequence
    end
    Incident.all.each do |incident|
      @array << incident.sequence
    end
    lastest_sequence = @array.sort.last
    self.update(sequence: lastest_sequence + 1)
  end
end
