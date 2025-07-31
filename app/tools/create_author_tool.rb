class CreateAuthorTool < ApplicationTool
  description "Create a new author"

  arguments do
    required(:first_name).filled(:string).description("The first name of the author")
    required(:last_name).filled(:string).description("The last name of the author")
    required(:nationality).filled(:string).description("The nationality of the author")
    required(:birthdate).filled(:date).description("The birth date of the author in the format 1960-07-11 00:00:00.000000000 +0000")
    required(:bio).filled(:string).description("A short bio of the author")
    required(:wikipedia_url).filled(:string).description("The Wikipedia URL of the author")
  end

  def call(first_name:, last_name:, nationality:, birthdate:, bio:, wikipedia_url:)
    author = Author.create!(first_name:, last_name:, nationality:, birthdate:, bio:, wikipedia_url:)

    JSON.generate(author.as_json)
  end
end