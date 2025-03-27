module SchemaDotOrg
  class ImageObject < SchemaType
    validated_attr :url, type: String
    validated_attr :height, type: Integer, allow_nil: true
    validated_attr :width, type: Integer, allow_nil: true
  end
end
