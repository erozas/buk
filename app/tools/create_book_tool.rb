class CreateBookTool < ApplicationTool
  description "Create a new book"

  arguments do
    required(:title).filled(:string).description("The title of the book")
    required(:isbn).filled(:string).description("The ISBN of the book")
    required(:excerpt).filled(:string).description("A short excerpt of the book")
    required(:description).filled(:string).description("A short description of the book")
    required(:pages_count).filled(:integer).description("The number of pages of the book")
    required(:published_at).filled(:date).description("The date of publication of the book in the format 1960-07-11 00:00:00.000000000 +0000")
    required(:author_name).filled(:string).description("The name of the author of the book")
  end

  def call(title:, isbn:, pages_count:, published_at:, author_name:, excerpt:, description:)
    book = Book.find_by(isbn:)

    if book
      book.update!(pages_count:, published_at:)
    else
      book = Book.create!(title:, isbn:, pages_count:, published_at:)
    end

    if book.persisted?
      first_name, last_name = author_name.split(" ", 2)
      author = Author.find_or_create_by!(first_name:, last_name:)
      book.authors << author unless book.authors.include?(author)
    end
    
    JSON.generate(book.as_json)
  end
end