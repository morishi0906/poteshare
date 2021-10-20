class RoomController < ApplicationController
  def rooms
    @users = User.find_by(id: session[:user_id])
    if params[:name].present?
      @rooms = Room.where('address LIKE ?', "%#{params[:name]}%")
      @search_word = params[:name]
    elsif params[:search].present?  
      @rooms = Room.where('room_message LIKE ?', "%#{params[:search]}%")
      @search_word = params[:search]
    else
      @rooms = Room.none
    end
  end  
  
  def create
     @rooms = Room.new(params.permit(:id, :room_name, :room_message, :price, :address, :room_img,:user_id))
    if @rooms.save
        flash[:notice] = "ルームの登録が完了しました。"
        redirect_to "/room/#{@rooms.id}/show"
    else
        flash[:notice] = @rooms.errors.full_messages
        redirect_to "/room/new"
    end
  end

  
  def show
    @users = User.find_by(id: session[:user_id])
    @rooms = Room.find_by(id: params[:id])
    @register = User.find(@rooms.user_id)
  end
  
  def reserve
    @users = User.find_by(id: session[:user_id])
    @rooms = Lent.new(params.permit(:startday, :endday, :price, :people, :room_id,:user_id))
    if @rooms.startday == nil || @rooms.endday == nil || @rooms.startday < Date.today
      redirect_to "/room/#{@rooms.room_id}/show"
      flash[:notice] = "入力に誤りがあります。"
    else  
      @start = @rooms.startday
      @end = @rooms.endday
      @days = 1 + (@end - @start).to_i
      if @days < 1
        redirect_to "/room/#{@rooms.room_id}/show"
        flash[:notice] = "入力に誤りがあります。"  
      else
        @all_price = @rooms.price * @rooms.people * @days 
      end
    end
  end
  
  def complete
    @users = User.find_by(id: session[:user_id])
    @lents = Lent.new(params.permit(:startday, :endday, :price, :people, :room_id,:user_id))
    @rooms = Room.find(@lents.room_id)
    if @lents.save
      flash[:notice] = "ルームの予約が完了しました。"
    else
      flash[:notice] = @rooms.errors.full_messages
      redirect_to "/room/reserve"
    end
  end

  def new
    @users = User.find_by(id: session[:user_id])
  end  
end
