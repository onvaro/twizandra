require 'pry'

enable :sessions
set :session_secret, 'by0B@!n0T662'

['/','/logout' ].each do |path|
  before path do
    authenticate!
  end
end

get "/" do
  @user = user_by session[:username]
  erb :index
end

get "/login" do
  erb :login
end

get "/register" do
  erb :register
end

post "/login" do
  session[:username] = nil
  
  username = params[:username]
  password = params[:password]
  
  saved_password = password_for username
  # TODO login only if password match and redirect to homepage
  session[:username] = username if saved_password == password
  
  redirect "/"  
end

post "/register" do
  session[:username] = nil
  
  user = {username: params[:username].to_s, password: params[:password].to_s, name: params[:name].to_s}
  
  unless user[:username].empty? && user[:password].empty?
    create user
    session[:username] = user[:username]
  end
    
  redirect "/"    
end

delete "/logout" do
  session[:username] = nil
  redirect "/login"
end


private

# # Connection using binary protocol
# def connection
#   @db = Connection.client
# end
# 

def authenticate!
  redirect '/login' if session[:username].nil?  
  @user = user_by session[:username]  
end

def user_by username
  connection
  
  user = @db.execute("SELECT name FROM users WHERE username = '#{username}'").first
  tweet_count = @db.execute("SELECT count(*) FROM tweets WHERE username = '#{username}' ALLOW FILTERING").first
  followers = @db.execute("SELECT users FROM followers WHERE username = '#{username}'").first
  friends = @db.execute("SELECT users FROM friends WHERE username = '#{username}'").first

  followers_count = followers.nil? ? 0 : followers["users"].size
  friends_count = friends.nil? ? 0 : friends["users"].size

  {:username => username, :name => user['name'], :tweets_count => tweet_count["count"], :followers => followers_count, :friends => friends_count}    
end

def create user
  @db ||= connection  
  @db.execute("INSERT INTO users (username, name, password) VALUES('#{user[:username]}', '#{user[:name]}', '#{user[:password]}')")
end

def password_for username
  @db ||= connection  
  row = @db.execute("SELECT password FROM users WHERE username = '#{username}'").first
  row["password"] unless row.nil?
end