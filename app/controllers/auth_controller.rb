class AuthController < ApplicationController
  skip_before_action :authenticate_user!, only: [:oauth_callback]

  def oauth_callback
    if team_member?
      user = User.find_or_create_by(github_login: github_login)
      sign_in(user)
      session[:token] = auth_hash.credentials.token
      flash[:success] = "You successfully signed in"
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  private

  def team_member?
    auth_hash.credentials.team_member?
  end

  def github_login
    info.login
  end

  def auth_email
    info.email
  end

  def info
    auth_hash.info
  end

  def auth_hash
    request.env["omniauth.auth"]
  end
end
