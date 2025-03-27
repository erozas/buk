class Avo::Resources::Author < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  self.search = {
    query: -> {
      if params[:via_association] == 'has_many'
        query.ransack(id_eq: params[:q], m: "or").result(distinct: false).order(last_name: :asc)
      else
        query.ransack(id_eq: params[:q], m: "or").result(distinct: false)
      end
    }
  }

  self.find_record_method = -> {
    begin
      query.friendly.find(id)
    rescue ActiveRecord::RecordNotFound
      query.where(id)
    end
  }
  
  def fields
    field :id, as: :id
    field :first_name, as: :text
    field :last_name, as: :text
    field :birthdate, as: :date
    field :nationality, as: :text
    field :bio, as: :textarea
    field :books_published_count, as: :number
    field :wikipedia_url, as: :text
  end
end
