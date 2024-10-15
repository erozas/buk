class StaticController < ApplicationController
  def home
    @books = Book.all
  end
end
