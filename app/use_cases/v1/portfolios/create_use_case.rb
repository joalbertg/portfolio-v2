# frozen_string_literal: true

module V1
  module Portfolios
    class CreateUseCase < ApplicationUseCase
      def initialize(params)
        super()

        @params = params
      end

      def call
        ActiveRecord::Base.transaction do
          create_stocks
          build_portfolio
          create_stock_records
          response(success: true, payload: portfolio)
        end
      rescue => error
        response(error:)
      end

      private

      attr_reader :params, :stocks, :portfolio

      def create_stocks
        @stocks = params[:stocks].each_with_object({}) do |stock, hash|
          result = Stocks::FindOrCreateService.call(stock)
          reise(result.error) unless result.success?

          hash[stock[:symbol]] = result.payload
        end
      end

      def build_portfolio
        result = Portfolios::BuildService.call(name: params[:name])
        raise(result.error) unless result.success?

        @portfolio = result.payload
      end

      def create_stock_records
        params[:stocks].each do |stock|
          result = StockRecords::BuildService.call(stock)
          reise(result.error) unless result.success?
          
          current_stock = stocks[stock[:symbol]]
          current_stock.portfolios << portfolio

          portfolio_detail = current_stock.portfolio_details.find { |portfolio_detail| portfolio_detail.portfolio_id == portfolio.id }
          portfolio_detail.stock_records << result.payload
        end
      end
    end
  end
end
