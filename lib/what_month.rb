module WhatMonth
  MONTHS_ES = %w[enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre]
  def month_in_es(month_number)
    MONTHS_ES[month_number - 1]
  end
end
