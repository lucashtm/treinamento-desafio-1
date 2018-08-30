class SessionsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    session[:user_id] = user.id
    redirect_to products_path
  end
end
