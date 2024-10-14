class Avo::Resources::Book < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :title, as: :text
    field :isbn, as: :text
    field :excerpt, as: :textarea
    field :description, as: :textarea
    field :pages_count, as: :number
    field :author_name, as: :text
  end
end
