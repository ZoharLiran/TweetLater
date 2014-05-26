class WelcomeController < ApplicationController
  include WelcomeHelper
  
  def index
  end

  def sign_in
    redirect_to '/auth/:provider'
  end

  def signin_callback
    @name = request.env["omniauth.auth"]["extra"]["raw_info"]["name"]
    @user = User.find_or_initialize_by_screen_name(params_from_hash)
    @user.update_attributes(params_from_hash)
  end
end
