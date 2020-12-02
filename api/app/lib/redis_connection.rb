# frozen_string_literal: true

module RedisExporter
  class RedisConnection
    attr_accessor :connection

    def connection
      @connection ||= Redis.new(
        host: ENV['REDIS_HOST'],
        port: ENV['REDIS_PORT']
      )
    end

    def info
      connection.info
    end
  end
end
