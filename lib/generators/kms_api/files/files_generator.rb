# frozen_string_literal: true
require 'rails/generators'
# require 'rails/generators/base'
require_relative 'core'

module KmsApi
  # Add GraphQL to a Rails app with `rails g graphql:install`.
  #
  # Setup a folder structure for GraphQL:
  #
  # ```
  # - app/
  #   - kms_graphql/
  #     - types/
  #       - query_type.rb
  #     - mutations/
  #     - {app_name}_schema.rb
  # ```
  #
  # (Add `.gitkeep`s by default, support `--skip-keeps`)
  #
  # Add a controller for serving GraphQL queries:
  #
  # ```
  # app/controllers/kms/api/graphql_controller.rb
  # ```

  class FilesGenerator < Rails::Generators::Base
    include Core

    desc "Install GraphQL folder structure and boilerplate code"
    source_root File.expand_path('../templates', __FILE__)

    class_option :schema,
      type: :string,
      default: nil,
      desc: "Name for the schema constant (default: {app_name}Schema)"

    class_option :skip_keeps,
      type: :boolean,
      default: false,
      desc: "Skip .keep files for source control"

    class_option :skip_graphiql,
      type: :boolean,
      default: false,
      desc: "Skip graphiql-rails installation"

    class_option :skip_mutation_root_type,
      type: :boolean,
      default: false,
      desc: "Skip creation of the mutation root type"

    class_option :relay,
      type: :boolean,
      default: false,
      desc: "Include GraphQL::Relay installation"

    class_option :batch,
      type: :boolean,
      default: false,
      desc: "Include GraphQL::Batch installation"

    # These two options are taken from Rails' own generators'
    class_option :api,
      type: :boolean,
      desc: "Preconfigure smaller stack for API only apps"

    def create_folder_structure
      create_dir("app/kms_graphql/types")
      template("schema.erb", schema_file_path)

      # Note: You can't have a schema without the query type, otherwise introspection breaks
      template("query_type.erb", "app/kms_graphql/types/query_type.rb")
      insert_root_type('query', 'QueryType')

      # Create KmsModel and KmsEntry Types
      create_dir("app/kms_graphql/types/kms")
      template("model_type.erb", "app/kms_graphql/types/kms/model_type.rb")
      template("entry_type.erb", "app/kms_graphql/types/kms/entry_type.rb")
      
      create_mutation_root_type unless options.skip_mutation_root_type?

      # Create ModelMutations and EntryMutations Types
      create_dir("app/kms_graphql/mutations/kms")
      template("model_mutations.erb", "app/kms_graphql/mutations/kms/model_mutations.rb")
      template("entry_mutations.erb", "app/kms_graphql/mutations/kms/entry_mutations.rb")


      template("graphql_controller.erb", "app/controllers/kms/api/graphql_controller.rb")
    end
  end
end

