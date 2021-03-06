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
			redirect "/profile/#{user.id}"
		  else
			redirect "/failure"
		  end
  end

  get '/signup' do
    
    erb :signup
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to "/failure"
    else
    user = User.create(username: params[:username], password: params[:password])
    session[:user_id] = user.id
      redirect to "/profile/#{user.id}"
    end
  end

  get '/profile/:id' do
    @user = User.find_by(id: params[:id])
    # @outfits = @user.outfits
    erb :profile
  end

  get '/logout' do
    session.clear 
    redirect "/"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
  
  helpers do
    def current_user
      @user = User.find_by(id: session[:user_id])
    end

    def redirect_if_not_logged_in
        redirect '/login' unless current_user
    end

  end
end
