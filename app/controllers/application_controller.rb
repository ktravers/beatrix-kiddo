class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
  helper_method :current_user

  def logged_in?
    !!current_user
  end
  helper_method :logged_in?

  def login_required(redirect_path: root_path)
    unless logged_in?
      session[:redirect_path] = redirect_path
      return redirect_to "#{login_path}#login"
    end
  end

  def graceful_redirect(message)
    flash.alert = String(message)
    return redirect_to root_path
  end
end
