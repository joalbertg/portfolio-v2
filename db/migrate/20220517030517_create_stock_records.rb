# frozen_string_literal: true

class CreateStockRecords < ActiveRecord::Migration[7.0]
  def change
    create_table(:stock_records, id: :uuid, comment: 'table of stock records') do |t|
      t.uuid(:portfolio_detail_id, null: false, foreign_key: true, comment: 'portfolio stock references column')
      t.integer(:amount, null: false, comment: 'amount of stock purchased')
      t.decimal(:price, null: false, comment: 'price of stock')
      t.datetime(:purchase_date, null: false, comment: 'purchace date')

      t.timestamps
    end

    add_index(:stock_records, :portfolio_detail_id)

    add_foreign_key(:stock_records, :portfolio_details, column: :portfolio_detail_id, primary_key: :id)
  end
end
