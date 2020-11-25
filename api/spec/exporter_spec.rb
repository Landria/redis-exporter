ENV['APP_ENV'] = 'test'

require 'rspec'
require 'rack/test'
require './app/exporter'

describe 'Exporter' do
  include Rack::Test::Methods

  def app
    Exporter.new
  end

  it "returns redis info hash" do
    get '/metrics'

    expect(last_response).to be_ok
    expect(JSON.parse(last_response.body)).to be_a(Hash)
  end
end
