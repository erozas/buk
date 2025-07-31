class LatestBooksResource < ApplicationResource
  uri "latest_books"
  resource_name "Latest books"
  description "Get the latest published books in the platform"
  mime_type "application/json"

  def content
    JSON.generate(Book.order(created_at: :desc).limit(5).as_json)
  end
end