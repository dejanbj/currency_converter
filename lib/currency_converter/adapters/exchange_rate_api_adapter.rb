# frozen_string_literal: true

module CurrencyConverter
  module Adapters
    class ExchangeRateApiAdapter < BaseAdapter
      base_uri 'https://open.er-api.com/v6'

      def self.fetch_rates(currency)
        response = get("/latest/#{currency}")

        ::CurrencyConverter::Models::ExchangeRateInfo.new(currency:, rates: response['rates'])
      end
    end
  end
end
