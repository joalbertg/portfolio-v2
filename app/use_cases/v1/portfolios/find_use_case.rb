# frozen_string_literal: true

module V1
  module Portfolios
    class FindUseCase < ApplicationUseCase
      def initialize(params)
        super()

        @params = params
      end

      def call
        response(success: true, payload: find_portfolio)
      rescue => error
        response(error:)
      end

      private

      attr_reader :params

      def find_portfolio
        result = Portfolios::FindService.call(params)
        reise(result.error) unless result.success?

        result.payload
      end
    end
  end
end
