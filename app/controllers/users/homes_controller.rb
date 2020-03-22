class Users::HomesController < ApplicationController
  def top
    @popular_articles = Article.order('impressions_count DESC').take(6)
  end

  def about
  end

  def privacy
  end

  def contact
  end

  def tos
  end


end
