require "#{File.dirname(__FILE__)}/spec_helper"

describe 'main application' do
  include Rack::Test::Methods
  
  def app
    Sinatra::Application.new
  end
  
  it 'should show index page' do
    get '/'
    last_response.should be_ok
  end
  
  it 'should return user timeline' do
    pending
  end
end