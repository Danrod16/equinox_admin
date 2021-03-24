class Landlord < ApplicationRecord
  has_many :flats, dependent: :destroy
  has_one_attached :photo

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
