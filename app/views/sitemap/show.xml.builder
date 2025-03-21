xml.instruct! :xml, version: "1.0", encoding: "UTF-8"
xml.urlset xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9" do
  static_urls = [root_url, about_us_url, faq_url, customers_url]
  
  static_urls.each do |url|
    xml.url do
      xml.loc url
      xml.changefreq "monthly"
    end
  end

  Article.published.find_each do |post|
    xml.url do
      xml.loc article_url(post)
      xml.lastmod post.updated_at.strftime("%Y-%m-%d")
      xml.changefreq "weekly"
      xml.priority 0.8
    end
  end

  Book.find_each do |book|
    xml.url do
      xml.loc book_url(book)
      xml.lastmod book.updated_at.strftime("%Y-%m-%d")
      xml.changefreq "weekly"
      xml.priority 0.8
    end
  end
end