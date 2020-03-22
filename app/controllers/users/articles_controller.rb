class Users::ArticlesController < ApplicationController
	impressionist :actions=> [:index, :show]

  def index
    @articles = Article.all
	@popular_articles = Article.order('impressions_count DESC').take(6)
  end

  def show
  	@article = Article.find(params[:id])
  	render json: { impression_count: @article.impressions_count }

  end



end
