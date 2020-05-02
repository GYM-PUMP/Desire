class Users::FoodsController < ApplicationController
	before_action :authenticate_user!, except: [:index,:show,]
	before_action :current_user, except: [:index,:show]

	def index
		@my_menu = MyMenu.new
		@foods = Food.where(user: current_user).or(Food.where(create_admin: true)).order(id: :desc).page(params[:page]).per(10)
		@food_genres = FoodGenre.all
		if params[:category].present?
			# もしcategoryにデータが入っている場合
			@food_genre = @food_genres.find_by(food_genre_name: params[:category])
			# ビューで渡した:categoryでgenre_nameを一致させそれを@genreとしてる
			@foods = Food.where(food_genre_id: @food_genre.id)
			 foods = Food.where(food_genre_id: @food_genre.id)
			@foods_quantity = foods.length
		else

		end
	end

	def edit
		@food = Food.find(params[:id])
	end

	def show
		@food = Food.find(params[:id])
		@my_menu = MyMenu.new
		@food_genres = FoodGenre.all
	end

	def update
		@food = Food.find(params[:id])
		if @food.update(food_params)
		   redirect_to users_food_path
		else
		   render "edit"
		end
	end

	def destroy
		food = Food.find(params[:id])
		food.destroy
	    redirect_to users_foods_path
	end

	private
	def food_params
		params.require(:food).permit(:user_id, :food_genre_id, :food_name, :food_content, :food_image, :ingestion_cal, :protein, :fat, :carb)
	end
end


