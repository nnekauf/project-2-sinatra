class OutfitsController < ApplicationController
    get '/outfits' do
        @outfits = Outfit.all
        erb :'/outfits/index'
    end

    get '/outfits/new' do
        erb :'/outfits/new'
    end

    post '/outfits' do
        user = User.find_by(id: session[:user_id])
        outfit = user.items.create(params[:outfit])

        redirect "/outfits/#{outfit.id}"
    end

    get '/outfits/:id' do
        @outfit = Outfit.find_by(id: params[:id])
        if !@outfit #if there is no outfit. go back to all outfits
            redirect '/outfits'
        end
        erb :'/outfits/show'
    end

    get '/outfits/:id/edit' do
        @outfit = Outfit.find_by(id: params[:id])
        if !@outfit #if there is no outfit. go back to all outfits
            redirect '/outfits'
        end
        erb :"/outfits/edit"
    end

    patch '/outfits/:id' do 
        @outfit = Outfit.find_by(id: params[:id])
        @outfit.update(params[:outfit])
        redirect to "/outfits/#{@outfit.id}"
      end

    delete '/outfits/:id' do
        @outfit = Outfit.find_by(id: params[:id])
        if @outfit.user_id == session[:user_id]
            @outfit.delete 
            redirect "/outfits"
        else
            erb :'/outfits/show'
        end
    end
end