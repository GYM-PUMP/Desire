class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to admins_user_path(@user.id)
		else
			render 'edit'
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :height, :age, :gender, :weight, :gym_id, :user_status)
	end
end
