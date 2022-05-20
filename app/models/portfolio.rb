# frozen_string_literal: true

class Portfolio < ApplicationRecord
  validates :name, presence: true

  has_many :portfolio_details
  has_many :stocks, through: :portfolio_details
end
