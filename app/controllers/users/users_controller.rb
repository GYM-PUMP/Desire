class Users::UsersController < ApplicationController
  def show
	  @user = User.find(params[:id])
  end

  def index
  	  @users = User.all
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
  		  redirect_to user_path(@user), notice: "successfully updated user!"
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


private
  def user_params
  	  params.require(:user).permit(:name, :name_kana, :postal_code, :address, :height, :age, :gender, :weight, :gym_id, :customer_status)
  end


  #url直接防止　メソッドを自己定義してbefore_actionで発動。
   def baria_user
  	   unless params[:id].to_i == current_user.id
  		      redirect_to user_path(current_user)
  	   end
   end

end
