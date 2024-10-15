class Avo::Resources::BookReview < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :user, as: :belongs_to
    field :book, as: :belongs_to
    field :rating, as: :number
    field :content, as: :textarea
  end
end
