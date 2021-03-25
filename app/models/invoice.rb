class Invoice < ApplicationRecord
  belongs_to :booking

  def rent_with_iva
    iva_subtotal = self.booking.rent - (self.booking.rent * 0.79)
    total_iva = self.booking.rent + iva_subtotal
  end

  def iva
    iva_subtotal = self.booking.rent - (self.booking.rent * 0.79)
  end
end
