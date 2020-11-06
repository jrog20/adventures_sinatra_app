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
    if logged_in?
      @adventure = Adventure.all.find_by_id(params[:id])
      erb :'adventures/show'
    else
      redirect '/login'
    end
  end

  get '/adventures/:id/edit' do
    @adventure = Adventure.find_by_id(params[:id])
    erb :'adventures/edit_adventure'
  end

  patch '/adventures/:id' do
    @adventure = Adventure.find_by_id(params[:id])
    @adventure.update(params)
    redirect "/adventures/#{@adventure.id}"
  end

  delete '/adventures/:id' do
    @adventure = Adventure.find_by_id(params[:id])
    @adventure.destroy
    redirect '/adventures'
  end

end