require 'rake'
require 'cql'
require 'bundler/setup'
require 'rspec/core/rake_task'

task :default => :test
task :test => :spec

if !defined?(RSpec)
  puts "spec targets require RSpec"
else
  desc "Run all examples"
  RSpec::Core::RakeTask.new(:spec) do |t|
    #t.pattern = 'spec/**/*_spec.rb' # not needed this is default
    t.rspec_opts = ['-cfs']
  end
end

# Possible bug in cql-rb gem, hence using cqlsh --file command instead.
# TODO fix it.
namespace :db do
  task :create do
      twiz = File.open("schema/twizandra.cql").read
      client = Cql::Client.connect(host: '127.0.0.1')
      client.execute(twiz)
      
      client.use('twizandra')
  end
end