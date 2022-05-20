# frozen_string_literal: true

class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table(:stocks, id: :uuid, comment: 'table of stocks') do |t|
      t.string(:name, null: false, comment: 'name that describes the stock')
      t.string(:symbol, null: false, comment: 'stock symbol e.g. AAPL')

      t.timestamps
    end

    add_index :stocks, :symbol, unique: true
  end
end
