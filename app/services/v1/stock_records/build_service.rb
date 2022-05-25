# frozen_string_literal: true

module V1
  module StockRecords
    class BuildService < ApplicationService
      def initialize(params)
        super()

        @params = params
      end

      def call
        response(success: true, payload: build_stock_record)
      rescue
        response(error: StandardError.new(self))
      end

      private

      attr_reader :params

      def build_stock_record
        StockRecord.new(
          amount: params[:amount],
          price: params[:price],
          purchase_date: DateTime.parse(params[:purchase_date])
        )
      end
    end
  end
end
