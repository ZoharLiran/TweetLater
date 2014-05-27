class TweetWorker
  include Sidekiq::Worker
  include TwitterHelper

  def perform(tweet_id)
    tweet = Tweet.find(tweet_id)
    user = tweet.user

    oauth_token = user.oauth_token
    oauth_secret = user.oauth_secret
    client({ token: oauth_token, secret: oauth_secret }).update(tweet.content)
  end
end
