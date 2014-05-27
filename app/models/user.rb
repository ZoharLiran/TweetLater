class User < ActiveRecord::Base
  has_many :tweets

  def tweet(content)
    @tweet = self.tweets.create!(content: content)
    TweetWorker.perform_async(@tweet.id)
  end
end
