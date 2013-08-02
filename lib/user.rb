class User
  include Virsandra::Model
  
  attribute :username, String
  attribute :name, String
  attribute :password, String
  
  table :users
  key :username
end