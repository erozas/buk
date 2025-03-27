class BooksController < ApplicationController
  before_action :set_book, only: [:show]
  before_action :set_schema, only: [:show]

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
  end

  private

  def set_book
    @book = Book.friendly.find(params[:id])
  end

  def set_schema
    author = SchemaDotOrg::Person.new(
      name: @book.author_name,
      url: author_url(@book.authors.first),
    )
    
    publisher = SchemaDotOrg::Organization.new(
      name: "Buk",
      url: "https://buk.com",
      logo: "https://buk.com/logo.png",
    )

    thumbnail = SchemaDotOrg::ImageObject.new(
      url: url_for(@book.cover),
    )

    @schema = SchemaDotOrg::Book.new(
      name: @book.title,
      author: author,
      publisher: publisher,
      isbn: @book.isbn,
      date_published: @book.published_at.to_date.iso8601,
      genre: @book.genres.map(&:name),
      description: @book.description,
      thumbnail: thumbnail,
    )
  end
end
