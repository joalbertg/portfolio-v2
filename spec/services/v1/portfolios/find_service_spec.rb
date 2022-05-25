# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(V1::Portfolios::FindService, type: :service) do
  describe '#class' do
    context 'when it is success' do
      describe 'with id nil' do
        it 'has correct types' do
          result = described_class.call(id: nil)

          expect(result.class).to eq(Struct::Response)
          expect(result.success?).to be(true)
          expect(result.payload).to be_nil
          expect(result.error).to be_nil
        end
      end

      describe 'with valid id' do
        subject(:portfolio) { create(:portfolio) }

        it 'returns a struct with portfolio' do
          id = portfolio.id
          name = portfolio.name
          result = described_class.call(id: portfolio.id)

          expect(result.success?).to be(true)
          expect(result.payload.class).to eq(Portfolio)
          expect(result.payload.id).to eq(id)
          expect(result.payload.id.size).to eq(36)
          expect(result.payload.name).to eq(name)
        end
      end
    end
  end
end
