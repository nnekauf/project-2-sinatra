require './config/environment'

class UsersController < ApplicationController

    get "/login" do
        erb :login
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

end