class Users::UsersController < ApplicationController

  before_action :authenticate_user!

  def show
	  @user = User.find(params[:id])
	  @hash = Gmaps4rails.build_markers(@user) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow place.name
    end
  end

  def index
  	  @users = User.where(user_status: true)
      @user = current_user
  end

  def edit
	  @user = User.find(params[:id])
	   if current_user.id != @user.id
	      redirect_to user_path(current_user)
	   end
  end

  def update
  	  @user = User.find(params[:id])
  	   if @user.update(user_params)
  		  redirect_to users_user_path(@user), notice: "successfully updated user!"
  	   else
  		  render "edit"
  	   end
  end


  def follow
      @users = User.find(params[:id])
  end

  def follower
      @users = User.find(params[:id])
  end

  def withdraw
		set_user
		if @user != current_user
			redirect_to root_path
		end
  end

  def status_change
		user = User.find(params[:id])
		sign_out(user)
		user.update(change_params)
		redirect_to root_path
  end

  def set_user
        @user = User.find_by(id: params[:id])
	end


private

  def user_params
  	  params.require(:user).permit(:name, :postal_code, :image, :address, :height, :age, :gender, :weight, :gym_id, :user_status, :movement)
  end

  def change_params
		params.permit(:user_status)
	end


  #url直接防止メソッドを自己定義してbefore_actionで発動。
   def baria_user
  	   unless params[:id].to_i == current_user.id
  		      redirect_to user_path(current_user)
  	   end
   end

end
