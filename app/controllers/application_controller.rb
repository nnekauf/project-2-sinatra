require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    erb :welcome
  end

  get "/login" do
    erb :login
  end

  get "/failure" do
    erb :failure
  end

  post 'login' do
    user = User.find_by(username: params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect "/profile"
		  else
			redirect "/failure"
		  end
  end

  get '/signup' do
    
    erb :signup
  end

  post 'signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to "/failure"
    else
    user = User.create(username: params[:username], password: params[:password])

      redirect to "/profile"
    end
  end

  get '/logout' do
    session.clear 
    redirect "/"
  end

end
