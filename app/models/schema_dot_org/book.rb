module SchemaDotOrg
  class Book < SchemaType
    validated_attr :name, type: String
    validated_attr :author, type: SchemaDotOrg::Person, allow_nil: true
    validated_attr :description, type: String, allow_nil: true
    validated_attr :publisher, type: SchemaDotOrg::Organization, allow_nil: true
    validated_attr :isbn, type: String, allow_nil: true
    validated_attr :date_published, type: String, allow_nil: true
    validated_attr :genre, type: Array, allow_nil: true
    validated_attr :about, type: String, allow_nil: true
    validated_attr :in_language, type: String, allow_nil: true
    validated_attr :thumbnail, type: SchemaDotOrg::ImageObject, allow_nil: true
  end
end