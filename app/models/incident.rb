class Incident < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  after_create :set_sequence

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
