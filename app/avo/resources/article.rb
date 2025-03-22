class Avo::Resources::Article < Avo::BaseResource
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
    field :user, as: :belongs_to
    field :title, as: :text
    field :excerpt, as: :text
    field :content, as: :markdown
    field :cover, as: :file, is_image: true
    field :slug, as: :text
  end
end
