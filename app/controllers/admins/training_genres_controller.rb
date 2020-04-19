class Admins::TrainingGenresController < ApplicationController
	before_action :authenticate_admin!

	def index
	  @training_genre = TrainingGenre.new
	  @training_genres = TrainingGenre.all
	end

	def create
	  @training_genre = TrainingGenre.new(training_genre_params)
	  @training_genres = TrainingGenre.all
	  if @training_genre.save
         redirect_to admins_training_genres_path
	  else
		 render "index"
	  end
	end

	def edit
	  @training_genre = TrainingGenre.find(params[:id])
    end

	def update
	  @training_genre = TrainingGenre.find(params[:id])
  	  if @training_genre.update(training_genre_params)
    	 redirect_to admins_training_genres_path
  	  else
    	 redirect_back(fallback_location: edit_admins_training_genre_path)
	  end
	end

	def destroy
	  training_genres = TrainingGenre.find(params[:id])
	  training_genres.destroy
	  redirect_to admins_training_genres_path
	end

    private
    def training_genre_params
      params.require(:training_genre).permit(:training_genre_name, :training_genre_image)
    end
end
