module Mutations::Kms::EntryMutations
  Create = GraphQL::Relay::Mutation.define do
    name "CreateEntry"
    description "Create new Entry."

    # Define input parameters
    input_field :collection_name, types.String
    input_field :values, types[types[types.String]]

    # Define return parameters
    return_field :entry, Types::Kms::EntryType
    return_field :errors, types.String

    resolve ->(object, inputs, ctx) {
      begin
        # Find Collection
        @collection = Kms::Model.find_by_collection_name(inputs[:collection_name])
        raise "Collection not found: #{inputs[:collection_name]}" unless @collection

        # Initialize and save Entry
        new_entry = @collection.entries.new(values: inputs[:values].to_h)
        new_entry.save!

        { entry: new_entry }
      rescue => e
        { errors: e.message }
      end
    }
  end

  Update = GraphQL::Relay::Mutation.define do
    name "UpdateEntry"
    description "Update existing Entry."

    # Define input parameters
    input_field :slug, types.String
    input_field :collection_name, types.String
    input_field :values, types[types[types.String]]

    # Define return parameters
    return_field :entry, Types::Kms::EntryType
    return_field :errors, types.String

    resolve ->(object, inputs, ctx) {
      begin
        # Find Collection
        @collection = Kms::Model.find_by_collection_name(inputs[:collection_name])
        raise "Collection not found: #{inputs[:collection_name]}" unless @collection
        
        # Find Entry
        @entry = @collection.entries.find_by_slug(inputs[:slug])
        raise "Entry not found: #{inputs[:slug]}" unless @entry
        
        # update Entry
        @entry.update_attributes(values: inputs[:values].to_h)

        { entry: @entry }
      rescue => e
        { errors: e.message }
      end
    }
  end

  Delete = GraphQL::Relay::Mutation.define do
    name "DeleteEntry"
    description "Delete existing Entry."

    # Define input parameters
    input_field :slug, types.String
    input_field :collection_name, types.String

    # Define return parameters
    return_field :entry, Types::Kms::EntryType
    return_field :errors, types.String

    resolve ->(object, inputs, ctx) {
      begin
        # Find Collection
        @collection = Kms::Model.find_by_collection_name(inputs[:collection_name])
        raise "Collection not found: #{inputs[:collection_name]}" unless @collection
        
        # Find Entry
        @entry = @collection.entries.find_by_slug(inputs[:slug])
        raise "Entry not found: #{inputs[:slug]}" unless @entry

        # Delete Entry
        @entry.destroy!

        { entry: @entry }
      rescue => e
        { errors: e.message }
      end
    }
  end
end
