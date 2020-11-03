class UsersController < ApplicationController

  get '/login' do
    if !logged_in?
      erb :'user/login'
    else
      # review this as I build
      redirect '/user/show'
    end
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect 'user/show'
    else
      redirect '/signup'
    end
  end

  get '/signup' do
    erb :'user/signup'
  end

end