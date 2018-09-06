class UsersController < ApplicationController
  skip_before_action :auth
  
  def index
    @users = User.all
  end
end
