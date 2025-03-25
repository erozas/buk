class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :set_schema, only: [:show]

  def index
    @articles = Article.published.order(published_at: :desc)
  end

  def show
    @article = Article.friendly.find(params[:id])
    @popular_articles = Article.published.order(published_at: :desc).limit(3)
  end

  private

  def set_schema
    organization = SchemaDotOrg::Organization.new(
      name: "Buk",
      url: "https://buk.com",
      email: "hello@buk.com",
      logo: "https://buk.com/logo.png",
      telephone: "+1234567890"
    )

    article = SchemaDotOrg::Article.new(
      name: @article.title,
      url: article_url(@article),
      description: @article.excerpt,
      article_body: @article.content,
      date_published: @article.published_at,
      publisher: organization,
      image: @article.image,
    )

    @schema = SchemaDotOrg::GraphContainer.new([organization, article])
  end
end
