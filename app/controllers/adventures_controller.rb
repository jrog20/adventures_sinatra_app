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
    if logged_in?
      erb :'adventures/new'
    else
      flash[:error] = "Please log in to create an adventure."
      redirect '/'
    end
  end

  post '/adventures' do
    adventure = current_user.adventures.build(params)
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
      redirect '/'
    end
  end

  get '/adventures/:id/edit' do
    @adventure = Adventure.find_by_id(params[:id])
    if authorized?(@adventure)
      erb :'adventures/edit_adventure'
    else
      flash[:error] = "You can only edit your own adventures."
      redirect '/'
    end
  end

  patch '/adventures/:id' do
    @adventure = Adventure.find_by_id(params[:id])
    @adventure.update(city: params[:city], country: params[:country], date: params[:date], image_url: params[:image_url])
    redirect "/adventures/#{@adventure.id}"
  end

  delete '/adventures/:id' do
    @adventure = Adventure.find_by_id(params[:id])
    if authorized?(@adventure)
      @adventure.destroy
      redirect '/adventures'
    else
      flash[:error] = "You can only delete your own adventures."
      redirect '/'
    end
  end

end