class TweetsController < ApplicationController

  get '/tweets/new' do
    erb :'tweets/new'
  end

  get '/tweets' do
    @user = User.find(session[:user_id])
    
    erb :'tweets/index'
  end

  post '/tweets' do
    tweet = Tweet.create(params)
    redirect "/tweets/#{tweet.id}"
  end

  get '/tweets/:id' do
    @tweet = Tweet.find(params[:id])
    erb :'tweets/show_tweet'
  end

  get '/tweets/:id/edit' do
    @tweet = Tweet.find(params[:id])
    erb :'tweets/edit_tweet'
  end

  patch '/tweets/:id' do
    tweet = Tweet.find(params[:id])
    tweet.update(content: params[:content])
    redirect "/tweets/#{tweet.id}"
  end

  delete '/tweets/:id' do
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

end
