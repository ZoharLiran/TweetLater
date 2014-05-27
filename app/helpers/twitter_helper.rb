module TwitterHelper
  
  def client(oauth_hash)
    # Twitter API
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_KEY"]
      config.consumer_secret     = ENV["TWITTER_SECRET"]
      config.access_token        = oauth_hash[:token]
      config.access_token_secret = oauth_hash[:secret]
    end
    return client
  end
end
