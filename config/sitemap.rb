# Set the host name for URL creation
require 'aws-sdk-s3'

SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  ENV["S3_BUCKET"],
  access_key_id: ENV["AWS_ACCESS_KEY_ID"],
  secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
  region: ENV["S3_REGION"]
)

SitemapGenerator::Sitemap.default_host = "localhost:3000"
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  add root_path, changefreq: "weekly", priority: 1
  add about_us_path, changefreq: "monthly", priority: 0.1
  add faq_path, changefreq: "monthly", priority: 0.2

  Book.find_each do |book|
    add book_path(book), changefreq: "weekly", priority: 0.5, lastmod: book.updated_at
  end

  Article.published.find_each do |article|
    add article_path(article), changefreq: "weekly", priority: 0.5, lastmod: article.updated_at
  end
end
