class UsersController < ApplicationController

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      flash[:error] = "Wrong login information. Please try again."
      redirect '/login'
    end
  end 

  get '/users/:id' do
    erb :'users/show'
  end

  get '/signup' do
    if !logged_in?
      flash[:error] = "Please sign up before you log in"
      erb :'users/signup'
    else
      redirect '/'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect '/signup'
    else
      user = User.create(params)
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    end
  end

  get '/logout' do
    session.destroy
    redirect '/'
  end

end