# frozen_string_literal: true
require 'generators/graphql/type_generator'

module KmsApi
    class ObjectGenerator < TypeGeneratorBase
      desc "Create a GraphQL::ObjectType with the given name and fields"
      source_root File.expand_path('../templates', __FILE__)

      argument :fields,
        type: :array,
        default: [],
        banner: "name:type name:type ...",
        desc: "Fields for this object (type may be expressed as Ruby or GraphQL)"

      class_option :node,
        type: :boolean,
        default: false,
        desc: "Include the Relay Node interface"

      def create_type_file
        template "object.erb", "app/kms_graphql/types/#{type_file_name}.rb"
      end
    end
  # end
end
