ENV['APP_ENV'] = 'test'

require 'rspec'
require 'rack/test'
require './app/exporter'

describe 'Exporter' do
  include Rack::Test::Methods

  def app
    Exporter.new
  end

  it "says hello" do
    get '/metrics'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Hello')
  end
end
