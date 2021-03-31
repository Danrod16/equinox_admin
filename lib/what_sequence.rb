module WhatSequence
  def set_sequence
    @array = []
    Invoice.all.each do |invoice|
      @array << invoice.sequence
    end
    Incident.all.each do |incident|
      @array << incident.sequence
    end
    CustomInvoice.all.each do |custom_invoice|
      @array << custom_invoice.sequence
    end
    latest_sequence = @array.sort.last
    unless latest_sequence == self.sequence 
      self.update(sequence:  latest_sequence + 1)
    end
  end
end