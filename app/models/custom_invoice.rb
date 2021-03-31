class CustomInvoice < ApplicationRecord
  include WhatSequence
  after_create :set_sequence

end
