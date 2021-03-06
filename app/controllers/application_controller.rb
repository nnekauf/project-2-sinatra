require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

   get "/" do
     erb :index
   end
  # get '/profile/' do
  #   "Hello World"
  # end
  
  
  

  # get "/failure" do
  #   erb :failure
  # end

 

  # helpers do
  #   def logged_in?
  #     !!session[:user_id]
  #   end

  #   def current_user
  #     @user = User.find_by(id: session[:user_id])
  #   end

  #   def redirect_if_not_logged_in
  #       redirect '/login' unless current_user
  #   end

  # end
end
