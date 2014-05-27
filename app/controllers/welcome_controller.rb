class WelcomeController < ApplicationController
  include WelcomeHelper
  
  def index
  end

  def sign_in
    redirect_to '/auth/:provider'
  end

  def signin_callback
    @name = request.env["omniauth.auth"]["extra"]["raw_info"]["name"]
    @user = User.find_or_create_by_screen_name(params_from_hash[:screen_name])
    @user.update_attributes(params_from_hash)
    @screen_name = @user.screen_name
  end

  def tweet
    @user = User.find_by_screen_name(params[:screen_name])
    @user.tweet(params["tweet"])
    @screen_name = @user.screen_name
    render "signin_callback"
  end
end
