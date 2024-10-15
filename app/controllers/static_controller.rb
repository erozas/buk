class StaticController < ApplicationController
  def home
    @books = Book.all
  end

  def faq; end

  def customers; end
end
