# frozen_string_literal: true

require 'sinatra'
require 'redis'
require './app/lib/redis_connection'
require './app/lib/parser'
require 'dotenv'

Dotenv.load

module RedisExporter
  class Api < Sinatra::Base
    get '/metrics/?:keys?' do
      keys = params[:keys]&.split(',')
      info = RedisExporter::RedisConnection.new.info

      RedisExporter::Parser.call(info: info, keys: keys).to_json
    end
  end
end
