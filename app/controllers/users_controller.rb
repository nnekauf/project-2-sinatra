

class UsersController < ApplicationController

    get "/users/login" do
        erb :'users/login'
    end

  

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/profile/#{user.id}"
         else
            redirect "/failure"
        end
    end
    
    get "/signup" do
  
        erb :"/users/signup"
    end

    post '/signup' do
        if params[:user][:username] == "" || params[:user][:password] == ""
            redirect to "/failure"
         else
            user = User.create(params[:user])
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        end
    end

    get 'users/:id' do
        # "if they have outfits, see all outfit names here with their link"
        @user = User.find_by(id: params[:id])
         @outfits = @user.outfits
         erb :'/users/show'
    end

    get 'users/logout' do
        session.clear 
        redirect "/"
    end

end