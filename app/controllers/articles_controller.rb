class ArticlesController < ApplicationController
  def index
    @articles = Article.published.order(published_at: :desc)
  end

  def show
    @article = Article.friendly.find(params[:id])
    @popular_articles = Article.published.order(published_at: :desc).limit(3)
  end
end
