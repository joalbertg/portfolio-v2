# frozen_string_literal: true

class Stock < ApplicationRecord
  validates :symbol, presence: true, uniqueness: true

  has_many :portfolio_details
  has_many :portfolios, through: :portfolio_details
end
