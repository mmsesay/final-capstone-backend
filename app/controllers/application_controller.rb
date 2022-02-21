class ApplicationController < ActionController::Base
  def current_user
    session[:current_user]
  end

  def pass_current_user(login_user)
    session[:current_user] = login_user
  end
end
