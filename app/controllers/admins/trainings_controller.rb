class Admins::TrainingsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@trainings = Training.page(params[:page]).reverse_order.per(10)
		@training_genres = TrainingGenre.all
		if params[:category].present?
			# もしcategoryにデータが入っている場合
			@training_genre = @training_genres.find_by(training_genre_name: params[:category])
			# ビューで渡した:categoryでgenre_nameを一致させそれを@genreとしてる
			@trainings = Training.where(training_genre_id: @training_genre.id)
			 trainings = Training.where(training_genre_id: @training_genre.id)
			@trainings_quantity = trainings.length
		else

		end
	end

	def create
		@training = Training.new(training_params)
		@training_genres = Training.all
		if @training.save
			redirect_to admins_training_path(@training)
		else
			render 'new'
		end
	end

	def new
		@training = Training.new
		@training_genres = Training.all
	end

	def edit
		@training = Training.find(params[:id])
	end

	def show
		@training = Training.find(params[:id])
	end


	def update
		@training = Training.find(params[:id])
		if @training.update(training_params)
			redirect_to admins_training_path
		else
			render "edit"
		end
	end


    private
	def training_params
		params.require(:training).permit(:training_genre_id, :training_name, :training_content, :training_image, :movie_url, :consumed_cal)
	end
end
