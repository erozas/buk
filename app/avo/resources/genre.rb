class Avo::Resources::Genre < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  self.find_record_method = -> {
    begin  
      query.friendly.find(id)
    rescue
      query.find(id)
    end
  }
  
  def fields
    field :id, as: :id
    field :name, as: :text
    field :excerpt, as: :text
    field :description, as: :textarea
    field :slug, as: :text
  end
end
