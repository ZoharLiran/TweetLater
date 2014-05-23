class WelcomeController < ApplicationController
  include WelcomeHelper
  
  def index
  end

  def sign_in
    redirect_to '/auth/:provider'
  end

  def tweet
    @name = request.env["omniauth.auth"]["extra"]["raw_info"]["name"]
    @user = User.find_or_create_by_screen_name(params_from_hash)
  end
end
