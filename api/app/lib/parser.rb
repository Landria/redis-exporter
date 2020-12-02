# frozen_string_literal: true

module Exporter
  class Parser
    class << self
      DEFAULT_KEYS = %w(clients keyspace)

      def call(info:, keys:)
        info.select do |key, _value|
          key.match(/#{metrics(keys)}/)
        end
      end

      private

      def metrics(keys)
        (keys || DEFAULT_KEYS).join("|")
      end
    end
  end
end
