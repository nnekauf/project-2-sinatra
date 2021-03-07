class OutfitsController < ApplicationController
    get '/outfits' do
        redirect_if_not_logged_in
        @outfits = Outfit.all
        erb :'/outfits/index'
    end

    get '/outfits/new' do
        redirect_if_not_logged_in
        erb :'/outfits/new'
    end

    post '/outfits' do
        # user = User.find_by(id: session[:user_id])
        # outfit = user.items.create(params[:outfit])
        outfit = current_user.items.create(params[:outfit])
        redirect "/outfits/#{outfit.id}"
    end

    get '/outfits/:id' do
        redirect_if_not_logged_in
        @outfit = Outfit.find_by(id: params[:id])
        if !@outfit #if there is no outfit. go back to all outfits
            redirect '/outfits'
        end
        erb :'/outfits/show'
    end

    get '/outfits/:id/edit' do
        redirect_if_not_logged_in
        @outfit = Outfit.find_by(id: params[:id])
         
        redirect_if_not_owner(@outfit)
        erb :"/outfits/edit"
    end

    patch '/outfits/:id' do 
        @outfit = Outfit.find_by(id: params[:id])
        if check_owner(@outfit)
            @outfit.update(params[:outfit])
        end
        erb :'/outfits/show'
        # redirect to "/outfits/#{@outfit.id}"
      end

    delete '/outfits/:id' do
        @outfit = Outfit.find_by(id: params[:id])
        if check_owner(@outfit)
            @outfit.delete 
            redirect "/outfits"
        else
            erb :'/outfits/show'
        end
    end
end