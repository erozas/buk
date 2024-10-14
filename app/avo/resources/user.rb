class Avo::Resources::User < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :email, as: :text
    field :username, as: :text
    field :slug, as: :text
    field :sign_up_source, as: :text
    field :admin, as: :boolean
    field :provider, as: :text
    field :uid, as: :text
  end
end
