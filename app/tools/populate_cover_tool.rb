require 'open-uri'

class PopulateCoverTool < ApplicationTool
  description "Populate the cover of a book"

  arguments do
    required(:book_id).filled(:integer).description("The ID of the book")
    required(:cover_url).filled(:string).description("The URL of the cover in the standard format.")
  end

  def call(book_id:, cover_url:)
    book = Book.find(book_id)
    return JSON.generate(book.as_json) if book.cover.attached?

    book.cover.attach(io: URI.open(cover_url), filename: "cover.jpg")
    book.save!

    JSON.generate(book.as_json)
  end
end