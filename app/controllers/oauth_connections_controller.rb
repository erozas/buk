class OauthConnectionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user
      sign_in_and_redirect user
  end
end