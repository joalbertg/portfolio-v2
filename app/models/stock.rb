# frozen_string_literal: true

class Stock < ApplicationRecord
  validates :symbol, presence: true, uniqueness: true
end
