class UserController < ApplicationController
  def create
    @users = User.new(params.permit(:id, :name, :mail, :password, :password_confirmation))
    if @users.password == @users.password_confirmation
      if @users.save
        flash[:notice] = " 登録が完了しました。"
        redirect_to "/"
      else
        flash[:notice] = @users.errors.full_messages
        redirect_to "/new"
      end
    else
      flash[:notice] = "パスワードが一致しません"
      redirect_to "/new"
    end  
  end
 
  def edit
    @users = User.find_by(id: session[:user_id])
  end

  def update
    @users = User.find_by(id: params[:id])
    if @users.update(params.permit(:mail, :password))
      flash[:notice] = "更新されました。"
      redirect_to "/"
    else
      flash[:notice] = "更新に失敗しました"
      redirect_to "/user/#{@users.id}/account"
    end
  end  

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to "/"
  end  
  
  def account
    @users = User.find_by(id: params[:id])
  end
  
  def profile
    @users = User.find_by(id: params[:id])
  end
  
  def profileupdate
    @users = User.find_by(id: session[:user_id])
    if @users.update(params.permit(:name, :user_img, :message))
      flash[:notice] = "更新されました。"
      redirect_to "/"
    else
      flash[:notice] = "更新に失敗しました"
      redirect_to "/user/#{session[:user_id]}/profile"
    end
  end  
  
  def reserveroom
    @users = User.find_by(id: session[:user_id])
    @lents = Lent.where(user_id: session[:user_id])
  end  
  
  def createroom
    @users = User.find_by(id: session[:user_id])
    @rooms = Room.where(user_id: session[:user_id])
  end
end

private
  def user_params
    params.require(:user).permit(:name, :mail, :password, :password_confirmation, :image )
  end
