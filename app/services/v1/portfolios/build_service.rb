# frozen_string_literal: true

module V1
  module Portfolios
    class BuildService < ApplicationService
      def initialize(params)
        super()

        @params = params
      end

      def call
        response(success: true, payload: build_portfolio)
      rescue
        response(error: StandardError.new(self))
      end

      private

      attr_reader :params

      def build_portfolio
        Portfolio.new(name: params[:name])
      end
    end
  end
end
