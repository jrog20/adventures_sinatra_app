class AdventuresController < ApplicationController

  get '/adventures' do
    @adventures = Adventure.all
    erb :'adventures/index'
  end

  get '/adventures/:id' do
    @adventure = Adventure.all.find_by(params[:id])
    erb :'adventures/show'
  end

end