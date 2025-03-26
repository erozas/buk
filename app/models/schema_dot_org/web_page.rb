module SchemaDotOrg
  class WebPage < SchemaType
    validated_attr :name, type: String
    validated_attr :url, type: String
    validated_attr :description, type: String, allow_nil: true
    validated_attr :in_language, type: String, allow_nil: true
  end
end
