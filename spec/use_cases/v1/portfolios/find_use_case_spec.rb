# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(V1::Portfolios::FindUseCase) do
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
        it 'returns a struct with portfolio' do
          create(:portfolio, :id)

          id = 'c4efe665-d831-4352-9425-9dc0412a78bc'
          result = described_class.call(id:)

          expect(result.success?).to be(true)
          expect(result.payload.class).to eq(Portfolio)
          expect(result.payload.id).to eq(id)
          expect(result.payload.name).to eq('criptos')
        end
      end
    end
  end
end
