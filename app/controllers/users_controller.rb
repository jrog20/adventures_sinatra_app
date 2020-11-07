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
      erb :'users/signup'
      # , locals: {message: "Please sign up before you sign in"}
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
    if logged_in?
      session.destroy
      redirect '/login'
    else
      redirect '/'
    end
  end

  post '/logout' do
    erb :welcome 
  end

end