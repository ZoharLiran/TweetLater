class WelcomeController < ApplicationController
  def index
  end

  def sign_in
    redirect_to '/auth/:provider'
  end

  def tweet
    @tweet = Tweet.new
  end
end
