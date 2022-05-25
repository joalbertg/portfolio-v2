# frozen_string_literal: true

module V1
  module Stocks
    class FindOrCreateService < ApplicationService
      def initialize(params)
        super()

        @params = params
      end

      def call
        response(success: true, payload: find_or_create)
      rescue
        response(error: StandardError.new(self))
      end

      private

      attr_reader :params

      def find_or_create
        Stock.transaction(requires_new: true) do
          Stock.find_or_create_by(name: params[:name], symbol: params[:symbol])
        end
      end
    end
  end
end
