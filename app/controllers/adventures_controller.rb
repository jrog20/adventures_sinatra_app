class AdventuresController < ApplicationController

  get '/adventures' do
    @adventures = Adventure.all
    erb :'adventures/index'
  end

end