class SessionsController < ApplicationController
  skip_before_action :auth

  def create
    user = User.find(params[:user_id])
    session[:user_id] = user.id
    redirect_to products_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to users_path
  end
end
