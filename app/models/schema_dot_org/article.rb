module SchemaDotOrg
  class Article < SchemaType
    validated_attr :id, type: String, allow_nil: true
    validated_attr :author, type: SchemaDotOrg::Person, allow_nil: true
    validated_attr :name, type: String
    validated_attr :url, type: String, allow_nil: true
    validated_attr :image, type: SchemaDotOrg::ImageObject, allow_nil: true
    validated_attr :article_body, type: String, allow_nil: true
    validated_attr :description, type: String, allow_nil: true
    validated_attr :publisher, type: SchemaDotOrg::Organization, allow_nil: true
    validated_attr :date_published, type: String, allow_nil: true
    validated_attr :date_modified, type: String, allow_nil: true
  end
end
