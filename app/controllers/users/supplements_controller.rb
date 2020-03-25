class Users::SupplementsController < ApplicationController

	before_action :authenticate_user!

  def index
    @supplements = Supplement.all
    @genres = Genre.all
		if params[:category].present?
			# もしcategoryにデータが入っている場合
			@genre = @genres.find_by(genre_name: params[:category])
			# ビューで渡した:categoryでgenre_nameを一致させそれを@genreとしてる
			@supplements = Supplement.where(genre_id: @genre.id)
			supplements = Supplement.where(genre_id: @genre.id)
			@supplements_quantity = supplements.length
		else

		end
   end

end