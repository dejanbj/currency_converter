# frozen_string_literal: true

module CurrencyConverter
  module Adapters
    class ExchangeRateApiAdapter < BaseAdapter
      base_uri 'https://open.er-api.com/v6'

      def fetch_rates(currency)
        response = self.class.get("/latest/#{currency}")

        raise unless response['success']
        ExchangeRateInfo.new(currency, response['rates'])
      end
    end
  end
end
