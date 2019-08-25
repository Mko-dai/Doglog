class TweetsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]

  def index
    #Tweetから5行ごとにデータを取得し、降順に並び替えている
    @tweets = Tweet.all.order("id DESC").page(params[:page]).per(5)
  end

  def new
    @tweet=Tweet.new
  end

  def create
    Tweet.create(title: tweet_params[:title], text: tweet_params[:text], user_id: current_user.id)
    # Tweet.create(title:tweet_params[:title],text:tweet_params[:text],user_id: current_user.id)
  end

  def destroy
    tweet=Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end

  def show
    @tweet = Tweet.find(params[:id])
    @like = Like.new
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    Tweet.find(params[:id]).update(tweet_params)
    redirect_to action: :index
  end
  private
    def tweet_params
      params.require(:tweet).permit(:title, :text)
    end
    
    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end