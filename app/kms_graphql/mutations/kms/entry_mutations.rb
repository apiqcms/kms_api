module Mutations::Kms::EntryMutations
  Create = GraphQL::Relay::Mutation.define do
    name "CreateEntry"

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
      
      # Get Fileds of Collection
      collection_fields = @collection.fields
      hashed_values = inputs[:values].to_h
      
      # Construct New Entry
      new_entry = @collection.entries.new(values: {})
      collection_fields.each do |c_field|
        value = hashed_values[c_field.liquor_name]
        new_entry.values[c_field.liquor_name] = value if value.present?
      end
      
      # Save New Entry
      new_entry.save! ? { entry: new_entry } : { errors: new_entry.errors.to_a }
    }
  end

  Update = GraphQL::Relay::Mutation.define do
    name "UpdateEntry"

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
      # Get Fileds of Collection
      collection_fields = @collection.fields
      hashed_values = inputs[:values].to_h

      # Re-cunstruct Entry Values
      @entry.values ||= {}
      collection_fields.each do |c_field|
        value = hashed_values[c_field.liquor_name]
        @entry.values[c_field.liquor_name] = value if value.present?
      end

      # Update Entry
      @entry.save! ? { entry: @entry } : { errors: @entry.errors.to_a }
    }
  end

  Delete = GraphQL::Relay::Mutation.define do
    name "DeleteEntry"

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
      @entry.destroy! ? { status: true, entry: @entry } : { status: false, errors: @entry.errors.to_a }
    }
  end
end
