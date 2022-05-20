# frozen_string_literal: true

class Portfolio < ApplicationRecord
  validates :name, presence: true
end
