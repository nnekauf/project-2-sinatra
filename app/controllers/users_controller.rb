

class UsersController < ApplicationController

    get "/login" do
        if session[:user_id]
            redirect "/users/#{session[:user_id]}"
        end
        erb :'users/login'
    end

    post '/login' do
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect "/users/#{user.id}"
         else
            redirect "/failure"
        end
    end
    
    get "/signup" do
  
        erb :"/users/signup"
    end

    post '/signup' do
        user = User.create(params[:user])
        if user.id #if an id of the user exists that means it is unique
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else
            erb :'users/signup'
        end
    end

    get '/users' do 
        redirect_if_not_logged_in
        @users = User.all
        erb :'/users/index'

    end

    get '/users/:id' do
        redirect_if_not_logged_in
        @user = User.find_by(id: params[:id])
         @outfits = @user.outfits
         erb :'/users/show'
    end

    get '/logout' do
        session.clear 
        redirect "/"
    end

end