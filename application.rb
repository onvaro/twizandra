require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'cql'

configure do
  set :erb, :layout => :layout 
  set :views, "#{File.dirname(__FILE__)}/views"
  
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }
end