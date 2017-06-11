class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def unauthorized
    unless logged_in?
      @errors = ["You need to be logged in to enter."]
      render 'users/login'
    end
  end

  def host?(party)
    if logged_in?
      return party.host == current_user
    end
    false
  end

  helper_method :unauthorized
  helper_method :current_user
  helper_method :logged_in?
  helper_method :host?
end
