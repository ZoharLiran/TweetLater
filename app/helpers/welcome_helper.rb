module WelcomeHelper
  def params_from_hash
    screen_name = request.env["omniauth.auth"]["extra"]["raw_info"]["screen_name"]
    oauth_token = request.env["omniauth.auth"]["extra"]["access_token"].params["oauth_token"] 
    oauth_secret = request.env["omniauth.auth"]["extra"]["access_token"].params["oauth_token_secret"]
    result = {screen_name: screen_name,
              oauth_token: oauth_token,
              oauth_secret: oauth_secret}
  end
end
