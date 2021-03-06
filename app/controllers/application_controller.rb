class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def currentUser
    User.find(session[:id]) if session[:id]
  end
  helper_method :currentUser
  def requireLogin
    unless currentUser
      redirect_to '/'
    end
  end
end
