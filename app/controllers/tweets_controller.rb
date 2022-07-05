class TweetsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    def index
      @tweets = Tweet.all
    end
  
    def show
      @tweet = Tweet.find(params[:id])
      @user = @tweet.user
    end
  
    def new
      @tweet = Tweet.new
    end
  
    def create
      @tweet = Tweet.new(tweet_params)  # フォームから送られてきたデータ(body)をストロングパラメータを経由して@tweetに代入
      @tweet.user_id = current_user.id # user_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入
      @tweet.save
      redirect_to tweets_path
    end

    private

    def tweet_params
      #ストロングパラメーターとして、tweetModelのBodyのみを許可する
      #tweetのパラメーターはbodyとuser_idだが、user_idはツイートの投稿には不要なので許可しないようにしている
      params.require(:tweet).permit(:body)
    end
  
  end