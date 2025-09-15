# frozen_string_literal: true

require 'yaml'

module CurrencyConverter
  class CurrencyConfig
    class << self
      def load_config
        @config ||= begin
                      config_path = File.join(File.dirname(__FILE__), '..', 'config', 'currencies.yml')
                      YAML.load_file(config_path)
                    rescue Errno::ENOENT => e
                      raise "Currency configuration file not found: #{e.message}"
                    rescue ::Psych::SyntaxError => e
                      raise "Invalid YAML in currency configuration: #{e.message}"
                    end
        end
      end
  end
end
