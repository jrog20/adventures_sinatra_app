require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  # register Sinatra::ActiveRecordExtension

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "the_most_secret"
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
  end

  helpers do

    def logged_in?
      !!current_user
    end
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def authorized?(adventure)
      adventure.user == current_user
    end

  end

end
