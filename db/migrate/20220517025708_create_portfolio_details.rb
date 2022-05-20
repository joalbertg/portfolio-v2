# frozen_string_literal: true

class CreatePortfolioDetails < ActiveRecord::Migration[7.0]
  def change
    create_table(:portfolio_details, id: :uuid, comment: 'table of portfolio details') do |t|
      t.uuid(:portfolio_id, null: false, foreign_key: true, comment: 'portfolio reference column')
      t.uuid(:stock_id, null: false, foreign_key: true, comment: 'stock reference column')

      t.timestamps
    end

    add_index(:portfolio_details, :portfolio_id)
    add_index(:portfolio_details, :stock_id)
    add_index(:portfolio_details, [:portfolio_id, :stock_id], unique: true)

    add_foreign_key(:portfolio_details, :portfolios, column: :portfolio_id, primary_key: :id)
    add_foreign_key(:portfolio_details, :stocks, column: :stock_id, primary_key: :id)
  end
end
