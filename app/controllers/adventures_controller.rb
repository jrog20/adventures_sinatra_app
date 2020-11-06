class AdventuresController < ApplicationController

  get '/adventures' do
    @adventures = Adventure.all
    erb :'adventures/index'
  end

  get '/adventures/new' do
    erb :'adventures/new'
  end

  post '/adventures' do
    adventure = Adventure.create(params)
    adventure.user_id = current_user.id
    redirect '/adventures/#{adventure.id}'
  end

  get '/adventures/:id' do
    @adventure = Adventure.all.find_by(params[:id])
    erb :'adventures/show'
  end

end