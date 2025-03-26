module SchemaDotOrg
  class GraphContainer
    attr_reader :schema_objects

    def initialize(schema_objects)
      @schema_objects = schema_objects.flatten
    end
  
    def to_s
      to_json_ld
    end
  
    def to_json_ld(pretty: false)
      "<script type=\"application/ld+json\">\n" + to_json(pretty: pretty) + "\n</script>"
    end
  
    def to_json(pretty: false)
      structure = { 
        "@context" => "https://schema.org", 
        "@graph" => @schema_objects.map(&:to_json_struct),
      }
  
      if pretty
        JSON.pretty_generate(structure)
      else
        structure.to_json
      end
    end
  end
end