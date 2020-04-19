class Admins::FoodsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@foods = Food.page(params[:page]).reverse_order.per(10)
	end

	def create
		@food = Food.new(food_params)
		@food_genres = FoodGenre.all
		if @food.save
			redirect_to admins_food_path(@food)
		else
			render 'new'
		end
	end

	def new
		@food = Food.new
		@food_genres = FoodGenre.all
	end

	def edit
		@food = Food.find(params[:id])
	end

	def show
		@food = Food.find(params[:id])
	end


	def update
		@food = Food.find(params[:id])
		if @food.update(food_params)
			redirect_to admins_food_path
		else
			render "edit"
		end
	end


    private
	def food_params
		params.require(:food).permit(:food_genre_id, :food_name, :food_content, :food_image, :ingestion_cal, :protein, :fat, :carb)
	end
end
