# frozen_string_literal: true

ENV['APP_ENV'] = 'development'

require './app/api'

run RedisExporter::Api.new
