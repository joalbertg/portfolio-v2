# frozen_string_literal: true

module V1
  class PortfoliosController < ApplicationController
    def show
      response = Portfolios::FindUseCase.call(params)

      if response.success?
        render(json: response.payload.to_json)
      else
        render(json: { status: :unprocessable_entity })
      end
    end

    def create
      response = Portfolios::CreateUseCase.call(portfolio_params)

      if response.success?
        render(json: response.payload.to_json)
      else
        render(json: { status: :unprocessable_entity })
      end
    end

    private

    def portfolio_params
      params.require(:portfolio).permit(:name, stocks: %i[name symbol amount price purchase_date])
    end
  end
end
