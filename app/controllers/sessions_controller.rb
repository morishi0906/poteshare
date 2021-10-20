class SessionsController < ApplicationController
  def login
  end

  def create
    @user = User.find_by(mail: params[:mail])
    if @user && @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "  ログインしました。"
      redirect_to "/"
    else
      flash[:notice] = "ログインに失敗しました"
      redirect_to "/login"
    end
    
  end
end
