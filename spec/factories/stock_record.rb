# frozen_string_literal: true

FactoryBot.define do
  factory :stock_record do
    portfolio_detail { nil }
    amount { 1 }
    price { '9.99' }
  end
end
