class Admins::FoodGenresController < ApplicationController
	before_action :authenticate_admin!

	def index
	  @food_genre = FoodGenre.new
	  @food_genres = FoodGenre.all
	end

	def create
	  @food_genre = FoodGenre.new(food_genre_params)
	  @food_genres = FoodGenre.all
	  if @food_genre.save
         redirect_to admins_food_genres_path
	  else
		 render "index"
	  end
	end

	def edit
	  @food_genre = FoodGenre.find(params[:id])
    end

	def update
	  @food_genre = FoodGenre.find(params[:id])
  	  if @food_genre.update(food_genre_params)
    	 redirect_to admins_food_genres_path
  	  else
    	 redirect_back(fallback_location: edit_admins_food_genre_path)
	  end
	end

	def destroy
	  food_genres = FoodGenre.find(params[:id])
	  food_genres.destroy
	  redirect_to admins_food_genres_path
	end

    private
    def food_genre_params
      params.require(:food_genre).permit(:food_genre_name, :food_genre_image)
    end
end
