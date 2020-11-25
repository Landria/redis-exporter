require 'sinatra'

class Exporter < Sinatra::Base
  get '/metrics' do
    'Hello'
  end
end
