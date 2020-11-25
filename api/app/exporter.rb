require 'sinatra'
require 'redis'

class Exporter < Sinatra::Base
  get '/metrics' do
    redis = Redis.new(host: "redis", port: 6379)
    redis.info.to_json
  end
end
