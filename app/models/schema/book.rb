module Schema
  class Book < SchemaDotOrg::SchemaType
    validated_attr :name, type: String
  end
end