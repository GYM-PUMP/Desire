class Users::MyMenusController < ApplicationController
	before_action :authenticate_user!

	def index
		@my_menus = MyMenu.where(user_id: current_user.id)
		@my_menu = MyMenu.all
		@daily_cal = DailyCal.new
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
	 	if  my_menus.find_by(training_id: @my_menu.training_id).present?
			my_menu = my_menus.find_by(training_id: @my_menu.training_id)
			my_menu.training_quantity += @my_menu.training_quantity
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

	def new
		@training = Training.new
	end

	def selftraining
		@training = Training.new(training_params)
		@training.create_admin = false
		@training.user_id = current_user.id
		@training.training_genre_id = TrainingGenre::USER_CREATE_GENRE
		if  @training.save
			@my_menu = MyMenu.new
			@my_menu.user_id = current_user.id
			@my_menu.training_id = @training.id
			@my_menu.save
			redirect_to users_my_menus_path
		else
			render 'new'
		end
	end


	def newfood
		@food = Food.new
	end

	def selffood
		@food = Food.new(food_params)
		@food.create_admin = false
		@food.user_id = current_user.id
		@food.food_genre_id = FoodGenre::USER_CREATE_GENRE
		if  @food.save
			@my_menu = MyMenu.new
			@my_menu.user_id = current_user.id
			@my_menu.food_id = @food.id
			@my_menu.save
			redirect_to users_my_menus_path
		else
			render 'new'
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

	def training_params
		params.require(:training).permit(:user_id, :training_genre_id, :training_name, :training_content, :training_image, :movie_url, :consumption_cal)
	end

	def food_params
		params.require(:food).permit(:user_id, :food_genre_id, :food_name, :food_content, :food_image, :ingestion_cal, :protein, :fat, :carb)
	end
end
