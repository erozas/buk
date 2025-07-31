module SchemaDotOrg
  class WebPage < SchemaType
    validated_attr :name, type: String
    validated_attr :url, type: String
    validated_attr :breadcrumb, type: SchemaDotOrg::BreadcrumbList, allow_nil: true
    validated_attr :author, type: SchemaDotOrg::Person, allow_nil: true
    validated_attr :date_published, type: String, allow_nil: true
    validated_attr :date_modified, type: String, allow_nil: true
    validated_attr :text, type: String, allow_nil: true
    validated_attr :description, type: String, allow_nil: true
    validated_attr :in_language, type: String, allow_nil: true
    validated_attr :is_part_of, type: SchemaDotOrg::WebSite, allow_nil: true
  end
end
