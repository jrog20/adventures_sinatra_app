class AdventuresController < ApplicationController

  get '/adventures' do
    if logged_in?
      @adventures = Adventure.all
      erb :'adventures/index'
    else
      flash[:error] = "Please log in to view adventures."
      redirect '/'
    end
  end

  get '/adventures/new' do
    erb :'adventures/new'
  end

  post '/adventures' do
    adventure = Adventure.create(params)
    adventure.user_id = current_user.id
    if adventure.save
      redirect "/adventures/#{adventure.id}"
    else
      flash[:error] = "Please fill out all fields: #{adventure.errors.full_messages.to_sentence}."
      redirect '/adventures/new'
    end
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
    @adventure.update(city: params[:city], country: params[:country], date: params[:date], image_url: params[:image_url])
    redirect "/adventures/#{@adventure.id}"
  end

  delete '/adventures/:id' do
    @adventure = Adventure.find_by_id(params[:id])
    @adventure.destroy
    redirect '/adventures'
  end

end