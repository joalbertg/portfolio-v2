# frozen_string_literal: true

class PortfolioDetail < ApplicationRecord
  validates :portfolio_id, uniqueness: { scope: :stock_id }

  belongs_to :portfolio
  belongs_to :stock
end
