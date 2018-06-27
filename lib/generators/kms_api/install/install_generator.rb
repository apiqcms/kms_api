# frozen_string_literal: true
require 'rails/generators'
# require 'rails/generators/base'
# require_relative 'core'

module KmsApi
  # Add a route for that controller:
  #
  # ```ruby
  # # config/routes.rb
  # post "/kms_api/graphql", to: "kms/api/graphql#execute"
  # ```
  #
  # Accept a `--relay` option which adds
  # The root `node(id: ID!)` field.
  #
  # Accept a `--batch` option which adds `GraphQL::Batch` setup.
  #
  # Use `--no-graphiql` to skip `graphiql-rails` installation.

  class InstallGenerator < Rails::Generators::Base
    # include Core

    desc "Install GraphQL folder structure and boilerplate code"

    GRAPHIQL_ROUTE = <<-RUBY
if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "api/graphiql", graphql_path: "/api"
  end
  mount Kms::Api::Engine => '/kms'
RUBY

    def create_folder_structure
      # This is a little cheat just to get cleaner shell output:
      log :route, 'graphiql-rails'
      shell.mute do
        route(GRAPHIQL_ROUTE)
      end

      if gemfile_modified?
        say "Gemfile has been modified, make sure you `bundle install`"
      end
    end

    private

    def gemfile_modified?
      @gemfile_modified
    end

    def gem(*args)
      @gemfile_modified = true
      super(*args)
    end
  end
end

