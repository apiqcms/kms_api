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
      # Find Collection
      @collection = Kms::Model.find_by_collection_name(inputs[:collection_name])
      return { errors: "Collection not found: #{inputs[:collection_name]}" } unless @collection

      # Construct New Entry
      hashed_values = inputs[:values].to_h
      new_entry = @collection.entries.new(values: hashed_values)
      
      # Save New Entry
      new_entry.save! ? { entry: new_entry } : { errors: new_entry.errors.to_a }
    }
  end

  Update = GraphQL::Relay::Mutation.define do
    name "UpdateEntry"
    description "Update existing Entry."

    # Define input parameters
    # input_field :entry_id, types.Int
    input_field :slug, types.String
    input_field :collection_name, types.String
    input_field :values, types[types[types.String]]

    # Define return parameters
    return_field :entry, Types::Kms::EntryType
    return_field :errors, types.String

    resolve ->(object, inputs, ctx) {
      # Find Collection
      @collection = Kms::Model.find_by_collection_name(inputs[:collection_name])
      return { errors: "Collection not found: #{inputs[:collection_name]}" } unless @collection
      
      # Find Entry
      @entry = @collection.entries.find_by_slug(inputs[:slug])
      return { errors: "Entry not found: #{inputs[:slug]}" } unless @entry
      
      # update Entry
      hashed_values = inputs[:values].to_h
      @entry.update_attributes(values: hashed_values) ? { entry: @entry } : { errors: @entry.errors.to_a }
    }
  end

  Delete = GraphQL::Relay::Mutation.define do
    name "DeleteEntry"
    description "Delete existing Entry."

    # Define input parameters
    # input_field :entry_id, types.Int
    input_field :slug, types.String
    input_field :collection_name, types.String

    # Define return parameters
    return_field :status, types.String
    return_field :entry, Types::Kms::EntryType
    return_field :errors, types.String

    resolve ->(object, inputs, ctx) {
      # Find Collection
      @collection = Kms::Model.find_by_collection_name(inputs[:collection_name])
      return { errors: "Collection not found: #{inputs[:collection_name]}" } unless @collection
      
      # Find Entry
      @entry = @collection.entries.find_by_slug(inputs[:slug])
      return { errors: "Entry not found: #{inputs[:slug]}" } unless @entry

      # Delete Entry
      @entry.destroy ? { status: true, entry: @entry } : { status: false, errors: @entry.errors.to_a }
    }
  end
end
