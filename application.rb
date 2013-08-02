require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'virsandra'

configure do
  set :erb, :layout => :layout 
  set :views, "#{File.dirname(__FILE__)}/views"
  
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }
end

Virsandra.configure |c|
  c.servers   = "127.0.0.1:9042"
  c.keyspace  = "twizandra"
end