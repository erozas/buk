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

  def set_article
    @article = Article.friendly.find(params[:id])
  end

  def set_schema
    organization = SchemaDotOrg::Organization.new(
      name: "Buk",
      url: "https://buk.com",
      email: "hello@buk.com",
      logo: "https://buk.com/logo.png",
      telephone: "+1234567890"
    )

    author = SchemaDotOrg::Person.new(
      name: @article.user.username,
      url: user_url(@article.user),
    )

    image = SchemaDotOrg::ImageObject.new(
      url: url_for(@article.cover),
      width: @article.cover.metadata["width"],
      height: @article.cover.metadata["height"]
    )

    article = SchemaDotOrg::Article.new(
      name: @article.title,
      url: article_url(@article),
      description: @article.excerpt,
      article_body: @article.content,
      date_published: @article.published_at.to_time.iso8601,
      publisher: organization,
      image: image,
      author: author
    )

    home_breadcrumb = SchemaDotOrg::ListItem.new(
      position: 1,
      name: "Home",
      item: root_url
    )

    blog_breadcrumb = SchemaDotOrg::ListItem.new(
      position: 2,
      name: "Blog",
      item: blog_url,
    )

    article_breadcrumb = SchemaDotOrg::ListItem.new(
      position: 3,
      name: @article.title,
      item: article_url(@article)
    )

    breadcrumbs = SchemaDotOrg::BreadcrumbList.new(
      item_list_element: [home_breadcrumb, blog_breadcrumb, article_breadcrumb]
    )

    @schema = SchemaDotOrg::GraphContainer.new([organization, article, breadcrumbs])
  end
end
