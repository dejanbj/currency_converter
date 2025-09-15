# frozen_string_literal: true

module CurrencyConverter
  module Adapters
    class BaseAdapter
      include HTTParty

      def fetch_rates(currency)
        raise NotImplementedError, :abstract_method
      end
    end
  end
end
