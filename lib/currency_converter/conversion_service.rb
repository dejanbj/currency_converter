# frozen_string_literal: true

module CurrencyConverter
  class ConversionService
    ADAPTER = CurrencyConverter::Adapters::ExchangeRateApiAdapter

    def initialize(from_currency:, to_currency:, amount:)
      @from_currency = from_currency
      @to_currency = to_currency
      @amount = amount
    end

    def call
      rates = ADAPTER.fetch_rates(@from_currency)
      rate_for_target_currency = rates.rate_for(@to_currency)
      @amount.to_f * rate_for_target_currency
    end
  end
end
