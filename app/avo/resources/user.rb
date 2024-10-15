class Avo::Resources::User < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
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
    field :email, as: :text
    field :username, as: :text
    field :avatar, as: :file, is_image: true
    field :slug, as: :text
    field :sign_up_source, as: :text
    field :admin, as: :boolean
    field :provider, as: :text
    field :uid, as: :text
  end
end
