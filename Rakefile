require 'rake'
require 'cql'

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