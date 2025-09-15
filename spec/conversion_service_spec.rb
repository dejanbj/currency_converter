# frozen_string_literal: true

RSpec.describe CurrencyConverter::ConversionService do
  subject { described_class.new(from_currency:, to_currency:, amount:) }

  let(:from_currency) { 'USD' }
  let(:to_currency) { 'EUR' }
  let(:amount) { '100' }

  describe '#call' do
    let(:adapter_return_value) do
      CurrencyConverter::Models::ExchangeRateInfo.new(currency: from_currency, rates:
        {
          'EUR' => 5,
          'JPY' => 10
        }
      )
    end

    before do
      allow(CurrencyConverter::Adapters::ExchangeRateApiAdapter).to receive(:fetch_rates).and_return(adapter_return_value)
    end

    it 'returns value of converted amount' do
      result = subject.call
      expect(result).to eq(500)
    end

    context 'when from_currency is not valid' do
      let(:from_currency) { 'invalid' }

      it 'raises error' do
        expect { subject.call }.to raise_error(CurrencyConverter::InvalidCurrencyError)
      end
    end

    context 'when to_currency is not valid' do
      let(:to_currency) { 'invalid' }

      it 'raises error' do
        expect { subject.call }.to raise_error(CurrencyConverter::InvalidCurrencyError)
      end
    end

    context 'when amount is not valid' do
      let(:amount) { 'invalid' }

      it 'raises error' do
        expect { subject.call }.to raise_error(CurrencyConverter::InvalidAmountError)
      end
    end
  end
end
