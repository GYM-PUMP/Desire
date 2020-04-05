class Users::ArticlesController < ApplicationController
	impressionist :actions=> [:index, :show]

  def index
    @articles = Article.all.reverse_order
	@popular_articles = Article.order('impressions_count DESC').take(8)
  end

  def show
  	@article = Article.find(params[:id])
  	render json: { impression_count: @article.impressions_count }

  end



end