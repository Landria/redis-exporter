# frozen_string_literal: true

module RedisExporter
  class Parser
    class << self
      DEFAULT_KEYS = %w[clients db].freeze
      KEYSPACE_KEYS = %w(keyspace db)
      KEYSPACE = 'db'
      PREFIX = 'redis_'

      def call(info:, keys:)
        result = {}

        (keys || DEFAULT_KEYS).each do |metric|
          result.merge! parse(info, metric)
        end

        result
      end

      private

      def parse(info, metric)
        return parse_keyspace(info) if KEYSPACE_KEYS.include?(metric)

        general_parse(info, metric)
      end

      def parse_keyspace(info)
        info.select do |key, _value|
          key.match(/^#{KEYSPACE}/)
        end.each_with_object({}) do |metric, k_space_data|
          db_name = metric.first
          data = metric.last.split(',').map { |d| d.split('=') }
          k_space_data[PREFIX + "keys_per_database_count{databse_name=#{db_name}}"] = data[0].last
          k_space_data[PREFIX + "keys_expiring_keys_count{databse_name=#{db_name}}"] = data[1].last
          k_space_data[PREFIX + "keys_average_key_ttl_seconds{databse_name=#{db_name}}"] = data[2].last
        end
      end

      def general_parse(info, metric)
        info.select do |key, _value|
          key.match(/^#{metric}|#{metric}$/)
        end.each_with_object({}) do |m, metric_data|
          metric_data[PREFIX + m.first] = m.last
        end
      end
    end
  end
end
