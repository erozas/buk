class StaticController < ApplicationController
  before_action :set_schema, only: [:home]

  def home
    @books = Book.all
  end

  def faq; end

  def customers; end

  def rss
    request.format = :xml
    respond_to do |format|
      format.xml
    end
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

    web_site = SchemaDotOrg::WebSite.new(
      url: "https://buk.com",
      name: "Buk",
      about: "Buk is a book sharing platform where users can gather and share their favorite books with each other.",
      publisher: organization
    )

    web_page = SchemaDotOrg::WebPage.new(
      url: "https://buk.com",
      name: "Buk",
      description: "Buk is a platform for reading books online.",
      in_language: "en-US",
    )

    @schema = SchemaDotOrg::GraphContainer.new([organization, web_site, web_page])
  end
end
