class TweetsController < ApplicationController

  get '/tweets/new' do
    if logged_in?
      erb :'tweets/new'
    else
      redirect '/login'
    end
  end

  get '/tweets' do
    if !logged_in?
      redirect '/login'
    end
    @user = current_user
    @tweets = Tweet.all
    erb :'tweets/index'
  end

  post '/tweets' do
    if params[:content].empty?
      redirect "/tweets/new"
    end 
    tweet = Tweet.create(params)
    tweet.user = current_user
    tweet.save
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
