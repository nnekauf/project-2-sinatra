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
        outfit = current_user.outfits.create(params[:outfit])
        if outfit.valid?
            redirect "/outfits/#{outfit.id}"
        else
            flash[:message] = outfit.errors.full_messages
            redirect '/outfits/new'
        end
        
    end

    get '/outfits/:id' do
        redirect_if_not_logged_in
        @outfit = Outfit.find_by(id: params[:id])
        @outfit_owner = User.find_by(id: @outfit.user_id)
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