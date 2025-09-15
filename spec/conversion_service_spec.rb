# frozen_string_literal: true

RSpec.describe CurrencyConverter::ConversionService do
  subject { described_class.new(from_currency:, to_currency:, amount:) }

  let(:from_currency) { 'USD' }
  let(:to_currency) { 'EUR' }
  let(:amount) { '100' }

  describe '#call' do
    let(:adapter_double) { class_double('::CurrencyConverter::Adapters::ExchangeRateApiAdapter') }
    let(:adapter_return_value) do
      CurrencyConverter::Models::ExchangeRateInfo.new(currency: from_currency, rates: {
        'EUR' => 5,
        'JPY' => 10
      })
    end

    before do
      allow(adapter_double).to receive(:fetch_rates).and_return(adapter_return_value)
    end

    it 'returns value of converted amount' do
      result = subject.call
      expect(result).to eq(500)
    end

    context 'when from_currency is not valid' do
      let(:from_currency) { 'invalid' }
    end

    context 'when to_currency is not valid' do
      let(:to_currency) { 'invalid' }
    end
  end
end
