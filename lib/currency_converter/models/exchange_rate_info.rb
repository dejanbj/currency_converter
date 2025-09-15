# frozen_string_literal: true

module CurrencyConverter
  module Models
    class ExchangeRateInfo
      def initialize(currency, rates)
        @currency = currency
        @rates = rates
      end

      def rate_for(currency)
        @rates[currency]
      end
    end
  end
end
