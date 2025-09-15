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
      validate_currencies!
      validate_amount!

      rates = ADAPTER.fetch_rates(@from_currency)
      rate_for_target_currency = rates.rate_for(@to_currency)
      @amount.to_f * rate_for_target_currency
    end

    private

    def validate_currencies!
      if !supported_currencies.include?(@to_currency) || !supported_currencies.include?(@from_currency)
        raise InvalidCurrencyError
      end
    end

    def validate_amount!
      Float(@amount)
    rescue ArgumentError
      raise InvalidAmountError
    end

    def supported_currencies
      @supported_currencies ||= CurrencyConverter::CurrencyConfig.load_config['currencies']
    end
  end
end
