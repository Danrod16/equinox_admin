class Incident < ApplicationRecord
  include WhatSequence
  belongs_to :booking
  belongs_to :user
  after_create :set_sequence

end
