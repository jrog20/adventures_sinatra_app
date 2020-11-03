class UsersController < ApplicationController

  get '/login' do
    erb :'user/login'
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      # flash[:error] = "Wrong login information."
      redirect '/login'
    end
  end 

  get '/users/:id' do
    erb :'user/show'
  end

  get '/signup' do
    erb :'user/signup'
  end

end