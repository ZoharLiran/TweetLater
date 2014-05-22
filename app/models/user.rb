class User < ActiveRecord::Base
  has_many :tweets

  def tweet(content)
    tweet = tweets.create!(content: content)
    
  end
end
