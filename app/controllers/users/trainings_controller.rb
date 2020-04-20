class Users::TrainingsController < ApplicationController
	before_action :authenticate_user!, except: [:index,:show,]
	before_action :current_user, except: [:index,:show]

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

	def show
		@training = Training.find(params[:id])
		@my_menu = MyMenu.new
		@training_genres = TrainingGenre.all
	end
end
