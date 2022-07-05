class RepliesController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    reply = current_user.replies.build(reply_params)
    reply.tweet_id = tweet.id
    reply.save
    redirect_to tweet_path(tweet.id)
  end

  private

  def reply_params
    params.require(:reply).permit(:body)
  end
end
