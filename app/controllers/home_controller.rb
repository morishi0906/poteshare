class HomeController < ApplicationController
  def index
    @users = User.find_by(id: session[:user_id])
  end
end
