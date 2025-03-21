class StaticController < ApplicationController
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
end
