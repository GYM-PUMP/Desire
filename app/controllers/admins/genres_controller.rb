class Admins::GenresController < ApplicationController

	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def edit
		@genre = Genre.find(params[:id])
    end

	def create
		@genre = Genre.new(genre_params)
		@genres = Genre.all
	if  @genre.save
		redirect_to admins_genres_path
  	else
		render "index"
  	end
	end


	def update
		@genre = Genre.find(params[:id])
  	if  @genre.update(genre_params)
    	redirect_to admins_genres_path
  	else
    	redirect_back(fallback_location: edit_admins_genre_path)
	end
	end

	def show
	end

	def destroy
		genres = Genre.find(params[:id])
	    genres.destroy
		redirect_to admins_genres_path
	end




	private
    def genre_params
      	params.require(:genre).permit(:genre_name, :genre_status,:genre_image)
    end
end
