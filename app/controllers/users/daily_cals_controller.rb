class Users::DailyCalsController < ApplicationController
before_action :authenticate_user!

	def index
		@daily_cals = DailyCal.where(user_id: current_user.id)
		@user = current_user
	end

	def create
		daily_cal = DailyCal.new(daily_cal_params)
		if 	daily_cal.save
			current_user.my_menus.each do | item |
					select_daily_cal = SelectDailyCal.new(daily_cal_id: daily_cal.id)
					select_daily_cal.food_id = item.food_id
					select_daily_cal.training_id = item.training_id
					select_daily_cal.training_quantity = item.training_quantity
					select_daily_cal.food_quantity = item.food_quantity
					select_daily_cal.save
				end
			current_user.my_menus.destroy_all
			redirect_to users_daily_cal_path(daily_cal.id)
		else
			render 'new'
		end
	end

	def new
		@total_ingestion_cal = 0
		@total_protein = 0
		@total_fat = 0
		@total_carb = 0
		@total_consumption_cal = 0
		@result_cal = 0
		@daily_cal = DailyCal.new
		@my_menus = MyMenu.where(user_id: current_user.id)
		@user = current_user
	end

	def show
		@my_menus = MyMenu.where(user_id: current_user.id)
		@daily_cal = DailyCal.find(params[:id])
		if current_user.id != @daily_cal.user_id
			redirect_to root_path
		end
	end


	private
	def daily_cal_params
		params.require(:daily_cal).permit(:user_id, :total_ingestion_cal, :total_protein, :total_fat, :total_carb, :total_consumption_cal, :result_cal, :weight, :limit_ingestion_cal, :limit_protein, :limit_fat, :limit_carb)
	end
end
