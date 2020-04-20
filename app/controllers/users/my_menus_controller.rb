class Users::MyMenusController < ApplicationController
	before_action :authenticate_user!

	def index
		@my_menus = MyMenu.where(user_id: current_user.id)
		@daily_cal = DailyCal.new
		@total_price = 0
	end

	def create
		@food_genres = FoodGenre.all
		@my_menu = MyMenu.new(my_menu_params)
		@my_menu.user_id = current_user.id
		@food = Food.find(@my_menu.food_id)
		my_menus = MyMenu.where(user_id: current_user.id)
		if  my_menus.find_by(food_id: @my_menu.food_id).present?
			my_menu = my_menus.find_by(food_id: @my_menu.food_id)
			my_menu.food_quantity += @my_menu.food_quantity
			my_menu.save(my_menu_params)
			redirect_to users_my_menus_path
    	else
    		if @my_menu.save
     			redirect_to users_my_menus_path
	    	else
		     	redirect_back(fallback_location: users_food_path(@my_menu.food_id))
	 		end
	 	end
	end

	def training
		@training_genres = TrainingGenre.all
		@my_menu = MyMenu.new(my_menu_params)
		@my_menu.user_id = current_user.id
		@training = Training.find(@my_menu.training_id)
		my_menus = MyMenu.where(user_id: current_user.id)
	 	if my_menus.find_by(training_id: @my_menu.training_id).present?
			my_menu = my_menus.find_by(training_id: @my_menu.training_id)
			my_menu.quantity += @my_menu.quantity
			my_menu.save(my_menu_params)
			redirect_to users_my_menus_path
    	else
    		if @my_menu.save
     			redirect_to users_my_menus_path
	    	else
		     	redirect_back(fallback_location: users_training_path(@my_menu.training_id))
	 		end
	 	end
	end

	def update
		@my_menus = MyMenu.where(user_id: current_user.id)
		@daily_cal = DailyCal.new
		@total_price = 0
		my_menu = MyMenu.find(params[:id])
		if my_menu.update(my_menu_params)
    		redirect_to users_my_menus_path
    	else
    		render 'index'
    	end
	end

	def destroy
		my_menu = MyMenu.find(params[:id])
	    my_menu.destroy
		redirect_to users_my_menus_path
	end

	def destroy_all
		my_menu = MyMenu.where(user_id: current_user.id)
	    my_menu.destroy_all
	    redirect_to users_my_menus_path
	end


	private
	def my_menu_params
		params.require(:my_menu).permit(:food_id, :training_id, :user_id, :food_quantity, :training_quantity)
	end
end
