class Admins::ArticlesController < ApplicationController
 before_action :authenticate_admin!

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admins_article_path(@article)
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to admins_article_path
    else
      render "edit"
    end
  end

  def destroy
      @article = Article.find(params[:id])
      @article.destroy
      redirect_to admins_articles_path, notice: "successfully delete article!"
  end

  private

  def article_params
      params.require(:article).permit(:title,:body,:article_image)
  end
end


