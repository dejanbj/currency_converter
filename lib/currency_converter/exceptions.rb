module CurrencyConverter
  class InvalidCurrencyError < StandardError; end
  class InvalidAmountError < StandardError; end
  class FailedToFetchRatesError < StandardError; end
end
