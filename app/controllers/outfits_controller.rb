class OutfitsController < ApplicationController
    get 'outfits' do

    end

    get '/outfits/new' do
        erb :'/outfits/new'
    end

    post '/outfits' do
        outfit = Outfit.create(params[:outfit])
        redirect "outfits/#{outfit.id}"
    end

    get 'outfits/:id' do
        erb :'outfits/show'
    end

    get 'outfits/:id/edit' do

    end

    delete 'outfits/:id' do

    end
end