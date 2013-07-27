# TODO load using config based on environment
module Connection
  def self.client
    connect
  end
    
  private
  def self.connect
    client = Cql::Client.connect(host: '127.0.0.1')
    client.use('twizandra')
    client
  end
end