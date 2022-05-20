# frozen_string_literal: true

class CreatePortfolios < ActiveRecord::Migration[7.0]
  def change
    create_table(:portfolios, id: :uuid, comment: 'table of portfolios') do |t|
      t.string(:name, null: false, comment: 'name that describes the portfolio')

      t.timestamps
    end
  end
end
