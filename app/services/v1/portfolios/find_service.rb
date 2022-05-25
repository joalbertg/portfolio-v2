# frozen_string_literal: true

module V1
  module Portfolios
    class FindService < ApplicationService
      def initialize(params)
        super()

        @params = params
      end

      def call
        response(success: true, payload: find_portfolio)
      rescue
        response(error: StandardError.new(self))
      end

      private

      attr_reader :params

      def find_portfolio
        Portfolio.find_by(id: params[:id])
      end
    end
  end
end
