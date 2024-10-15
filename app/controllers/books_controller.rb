class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.friendly.find(params[:id])
  end
end
