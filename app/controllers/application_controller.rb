class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
    @current_user = user
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end

  def authenticated?
    if current_user
     return true if current_user.authenticated == true
    end
    false
  end

  def ensure_logged_in
    # debugger
    if !authenticated?
      flash[:errors] = ["Please check your email for auth link"]
      redirect_to new_session_url
    elsif !logged_in?
      redirect_to new_session_url
    end
  end
end
