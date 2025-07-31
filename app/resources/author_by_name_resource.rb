class AuthorByNameResource < ApplicationResource
  uri "author_by_name"
  resource_name "Author by name"
  description "Get an author by name"
  mime_type "application/json"

  def content
    author = Author.find_by(first_name:, last_name:)

    if author
      JSON.generate(author.as_json)
    else
      JSON.generate({ error: "Author not found" })
    end
  end
end