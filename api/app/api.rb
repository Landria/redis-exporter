# frozen_string_literal: true

require 'sinatra'
require 'redis'
require './app/lib/redis_connection'
require './app/lib/parser'
require 'dotenv'

Dotenv.load

module Exporter
  class Api < Sinatra::Base
    get "/metrics/?:keys?" do
      keys = params[:keys]&.split(",")
      info = Exporter::RedisConnection.new.info
      Exporter::Parser.call(info: info, keys: keys).to_json
    end
  end
end
