class BooksController < ApplicationController
  def index
    query = Book.all
  
    # Apply category filtering
    if params[:genre].present?
      query = query.joins(:genres).where(genres: { slug: params[:genre] })
    end
  
    # Apply sorting
    case params[:sort]
    when "title_asc"
      query = query.order(title: :asc)
    when "title_desc"
      query = query.order(title: :desc)
    else # "recent" is default
      query = query.order(created_at: :desc)
    end
  
    @pagy, @books = pagy(query, items: 12)
  
    # Only render the books part if it's a Turbo Frame request
    render partial: "books/book_grid", locals: { books: @books, pagy: @pagy } if turbo_frame_request?
  end

  def show
    @book = Book.friendly.find(params[:id])
  end
end
