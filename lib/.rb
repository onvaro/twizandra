class User
  include Connection
  
  def self.find_by username
    @db ||= Connection.client
    
  end
end