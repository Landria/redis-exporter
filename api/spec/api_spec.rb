# frozen_string_literal: true

ENV['APP_ENV'] = 'test'

require 'spec_helper'
require './app/api'

describe 'RedisExporter::Api' do
  include Rack::Test::Methods

  def app
    RedisExporter::Api.new
  end

  it 'is successfull request' do
    get '/metrics'

    expect(last_response).to be_ok
    Approvals.verify(last_response.body, format: :json, name: 'metrics_response')
  end

  it 'returns redis info hash' do
    get '/metrics/clients,db'

    expect(last_response).to be_ok
    Approvals.verify(last_response.body, format: :json, name: 'metrics_response')
  end

  it 'returns redis info hash with unknown metric' do
    get '/metrics/clients,db,unknown'

    expect(last_response).to be_ok
    Approvals.verify(last_response.body, format: :json, name: 'metrics_response')
  end

  it 'returns redis info hash with keyspace as a key' do
    get '/metrics/clients,keyspace'

    expect(last_response).to be_ok
    Approvals.verify(last_response.body, format: :json, name: 'metrics_response')
  end
end
