class User < ActiveRecord::Base
  has_many :tweets

  def tweet(content)
    @tweet = self.tweets.create!(content: content)
    send_worker(@tweet.id)
  end

  private
  def send_worker(id)
    TweetWorker.perform_async(id)
  end
end
