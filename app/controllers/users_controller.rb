class UsersController < ApplicationController

  get '/signup' do
    if !session[:user_id].nil?
      redirect '/tweets'
    end
    erb :'users/create_user'
  end

  post '/signup' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect '/signup'
    end
    user = User.create(params)
    session[:user_id] = user.id
    redirect '/tweets'
  end
end
