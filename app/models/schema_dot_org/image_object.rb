module SchemaDotOrg
  class ImageObject < SchemaType
    validated_attr :url, type: String
    validated_attr :height, type: Integer
    validated_attr :width, type: Integer
  end
end
