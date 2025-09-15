# frozen_string_literal: true

require 'httparty'

require_relative 'currency_converter/version'
require_relative 'currency_converter/currency_config'
require_relative 'currency_converter/adapters/base_adapter'
require_relative 'currency_converter/adapters/exchange_rate_api_adapter'
require_relative 'currency_converter/models/exchange_rate_info'
require_relative 'currency_converter/conversion_service'
require_relative 'currency_converter/exceptions'

module CurrencyConverter
  class Error < StandardError; end
  # Your code goes here...
end
