class Avo::Resources::Book < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }
  self.find_record_method = -> {
    if id.is_a?(Array)
      query.where(slug: id)
    else
      # We have to add .friendly to the query
      query.friendly.find id
    end
  }

  def fields
    field :id, as: :id
    field :title, as: :text
    field :cover, as: :file, is_image: true
    field :isbn, as: :text
    field :excerpt, as: :textarea
    field :description, as: :textarea
    field :pages_count, as: :number
    field :published_at, as: :date
    field :authors, 
      as: :has_many, 
      through: :book_authors, 
      show_on: [:edit, :show], 
      scope: -> { query.alphabetical }
    field :author_name, as: :text, show_on: [:index, :show]
    field :genres,
      as: :has_many, 
      through: :book_genres, 
      show_on: [:edit, :show],
      scope: -> { query.alphabetical }
  end
end
