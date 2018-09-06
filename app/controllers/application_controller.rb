class ApplicationController < ActionController::Base
  
  before_action :auth
  helper_method :current_user

  def auth
    redirect_to users_path if current_user.blank?
  end

  def find_user
    User.find(session[:user_id]) if session[:user_id].present?
  end

  def current_user
    @current_user ||= find_user
  end

end
