# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples('common errors') do
  it do
    expect(subject.class).to eq(Struct::Response)
    expect(subject.success?).to be(false)
    expect(subject.payload).to be_empty
    expect(subject.error.class).to eq(StandardError)
  end
end

RSpec.describe(V1::Portfolios::BuildService, type: :service) do
  describe '#class' do
    context 'when successful' do
      describe 'with valid name' do
        it 'returns a struct with portfolio' do
          name = 'NASDAQ'
          result = described_class.call(name:)

          expect(result.success?).to be(true)
          expect(result.payload.class).to eq(Portfolio)
          expect(result.payload.id).to be_nil
          expect(result.payload.name).to eq(name)
        end
      end
    end

    context 'when it fails' do
      describe 'with a name in nil' do
        subject { described_class.call(name: nil) }

        include_examples 'common errors'
      end

      describe 'with an empty name' do
        subject { described_class.call(name: '  ') }

        include_examples 'common errors'
      end
    end
  end
end
