class Users::FoodsController < ApplicationController
	before_action :authenticate_user!, except: [:index,:show,]
	before_action :current_user, except: [:index,:show]

	def index
		@foods = Food.page(params[:page]).reverse_order.per(10)
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

	def show
		@food = Food.find(params[:id])
		@my_menu = MyMenu.new
		@food_genres = FoodGenre.all
	end
end
