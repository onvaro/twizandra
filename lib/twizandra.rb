require 'connection'
require 'pry'

enable :sessions
set :session_secret, 'by0B@!n0T662'

['/logout' ].each do |path|
  before path do
    authenticate!
  end
end

get "/" do
  erb :index
end

get "/login" do
  erb :login
end

get "/register" do
  erb :register
end

post "/login" do
  session[:user_id] = nil
  
  username = params[:username]
  password = params[:password]
  
  saved_password = password_for username
  # TODO login only if password match and redirect to homepage
  
  redirect "/"
  
end

delete '/logout' do
  session[:username] = nil
  redirect "/login"
end


private

def connection
  Connection.client
end
  